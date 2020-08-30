class HoneycombCustom
  def initialize(app)
    @app = app
  end

  def call(env)
    # This isn't needed; I found the field in the standard place. 
    # (I forgot what it was called. 'method' maybe)
    # but, we'll leave this here as a place to add custom fields.
    Honeycomb.add_field("request.verb", env["REQUEST_METHOD"])
    @app.call(env)
  end
end

Rails.application.config.middleware.use HoneycombCustom
