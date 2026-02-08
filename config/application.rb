require_relative 'boot'

require 'rails/all'
require 'carrierwave'
require 'carrierwave/orm/activerecord'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Cinemafull
  class Application < Rails::Application
    config.load_defaults 8.0

    config.i18n.default_locale = :ru
    config.i18n.available_locales = :ru
  end
end
