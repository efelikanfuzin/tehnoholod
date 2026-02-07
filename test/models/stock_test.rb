# frozen_string_literal: true

require 'test_helper'

class StockTest < ActiveSupport::TestCase
  test 'stock loaded from fixture has expected attributes' do
    stock = stocks(:one)
    assert_equal 'Test Stock Item', stock.title
    assert_equal 'test-stock-item', stock.slug
  end

  test 'stock requires title' do
    stock = Stock.new(description: 'desc', price: 100, sale_price: 80)
    stock.valid?
    assert stock.errors[:title].any?
  end

  test 'stock has friendly_id slug' do
    stock = stocks(:one)
    assert_not_nil stock.slug
    assert_not_empty stock.slug
  end

  test 'description_filled returns emoji based on meta_description presence' do
    stock = stocks(:one)
    stock.meta_description = 'Some description'
    assert_equal "\u2705", stock.description_filled

    stock.meta_description = ''
    assert_equal "\u274C", stock.description_filled
  end

  test 'keywords_filled returns emoji based on meta_keywords presence' do
    stock = stocks(:one)
    stock.meta_keywords = 'some keywords'
    assert_equal "\u2705", stock.keywords_filled

    stock.meta_keywords = ''
    assert_equal "\u274C", stock.keywords_filled
  end
end
