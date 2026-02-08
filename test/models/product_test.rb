# frozen_string_literal: true

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test 'product loaded from fixture has expected attributes' do
    product = products(:one)
    assert_equal 'Test Product', product.title
    assert_equal 'test-product', product.slug
  end

  test 'product requires title' do
    product = Product.new(description: 'desc', products_type: :public_catering)
    product.valid?
    assert product.errors[:title].any?
  end

  test 'product enum types work' do
    product = products(:one)
    assert product.public_catering?

    product2 = products(:two)
    assert product2.furniture?
  end

  test 'description_filled returns emoji based on meta_description presence' do
    product = products(:one)
    product.meta_description = 'Some description'
    assert_equal "\u2705", product.description_filled

    product.meta_description = ''
    assert_equal "\u274C", product.description_filled
  end

  test 'product has friendly_id slug' do
    product = products(:one)
    assert_not_nil product.slug
    assert_not_empty product.slug
  end
end
