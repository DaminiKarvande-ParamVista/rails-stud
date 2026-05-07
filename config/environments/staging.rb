require "active_support/core_ext/integer/time"

Rails.application.configure do
  config.enable_reloading = false
  config.eager_load = true

  config.consider_all_requests_local = false
  config.cache_store = :memory_store

  config.active_storage.service = :local

  config.force_ssl = false

  config.log_level = :info
  config.logger = ActiveSupport::Logger.new(STDOUT)

  config.active_job.queue_adapter = :async

  config.action_mailer.default_url_options = {
    host: ENV.fetch("APP_HOST", "66.116.234.181")
  }

  config.active_support.deprecation = :notify

  config.public_file_server.enabled = true

  config.assume_ssl = false
end
