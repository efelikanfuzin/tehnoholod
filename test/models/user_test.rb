# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'user fixtures are valid' do
    assert users(:admin).valid?
  end

  test 'user requires email' do
    user = User.new(password: 'password123')
    user.valid?
    assert user.errors[:email].any?
  end

  test 'user requires password with minimum length' do
    user = User.new(email: 'test@example.com', password: 'short')
    user.valid?
    assert user.errors[:password].any?
  end

  test 'user email must be unique' do
    existing = users(:admin)
    user = User.new(email: existing.email, password: 'password123')
    user.valid?
    assert user.errors[:email].any?
  end
end
