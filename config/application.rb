require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

Dotenv::Railtie.load

module CSC
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # available locales
    config.i18n.available_locales = [:en, :es]

    # default locale
    config.i18n.default_locale = :es

    # multy query
    config.active_record.async_query_executor = :global_thread_pool

    #Active Storage can't overwrite files
    config.active_storage.replace_on_assign_to_many = false
  end
end
