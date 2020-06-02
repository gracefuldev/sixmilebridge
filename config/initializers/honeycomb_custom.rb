class HoneycombCustom
  def initialize(app)
    @app = app
  end

  def call(env)
    Honeycomb.add_field("request.verb", env["REQUEST_METHOD"])
  ensure
    @app.call(env)
  end
end

Rails.application.config.middleware.use HoneycombCustom
