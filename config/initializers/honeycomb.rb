Honeycomb.configure do |config|
  honeycomb_key = ENV["HONEYCOMB_WRITEKEY"]
  if honeycomb_key.blank? && Rails.env.production?
    raise "Unable to send events. Not OK. Define HONEYCOMB_WRITEKEY to our Honeycomb API key"
  end
  if honeycomb_key.blank? # it's OK to not send events
    # warn "Not sending data to Honeycomb. Define HONEYCOMB_WRITEKEY to enable tracing."
    next
  end
  config.write_key = honeycomb_key
  config.dataset = Rails.env.production? ? "sixmilebridge" : "sixmilebridge-dev"
  Rails.logger.info "Honeycomb dataset: #{config.dataset}"
  config.presend_hook do |fields|
    if fields["name"] == "redis" && fields.has_key?("redis.command")
      # remove potential PII from the redis command
      if fields["redis.command"].respond_to? :split
        fields["redis.command"] = fields["redis.command"].split.first
      end
    end
    if fields["name"] == "sql.active_record"
      # remove potential PII from the active record events
      fields.delete("sql.active_record.binds")
      fields.delete("sql.active_record.type_casted_binds")
    end
  end
  config.notification_events = %w[
    sql.active_record
    render_template.action_view
    render_partial.action_view
    render_collection.action_view
    process_action.action_controller
    send_file.action_controller
    send_data.action_controller
    deliver.action_mailer
  ].freeze
end
