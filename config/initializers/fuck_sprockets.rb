Rails.application.config.assets.configure do |env|
  env.cache = Sprockets::Cache::FileStore.new(
      File.join('/tmp', 'cache/assets'),
      config.assets.cache_limit,
      env.logger
  )
end