require File.expand_path('../boot', __FILE__)

require 'rails/all'

if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
  Bundler.require(*Rails.groups(:assets => %w(development test)))
  # If you want your assets lazily compiled in production, use this line
  # Bundler.require(:default, :assets, Rails.env)
end

module Setminton
  class Application < Rails::Application
    config.time_zone = 'Copenhagen'

    config.i18n.default_locale = :da

    config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password, :password_confirmation]

    config.active_record.whitelist_attributes = false

    config.assets.enabled = true

    config.assets.version = '1.0'

    config.assets.initialize_on_precompile = false

    config.assets.precompile += %w(
      application.css
      setminton.css      
    )

    config.assets.precompile += %w(
      application.js
    )
  end
end
