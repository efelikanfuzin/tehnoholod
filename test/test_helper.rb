# frozen_string_literal: true

ENV['RAILS_ENV'] = 'test'
ENV['SECRET_KEY_BASE'] ||= 'test_secret_key_base_that_is_long_enough_for_rails_8'
require File.expand_path('../config/environment', __dir__)
require 'rails/test_help'
require 'minitest/pride'

module ActiveSupport
  class TestCase
    fixtures :all
  end
end
