# frozen_string_literal: true

require 'test_helper'

class PageTest < ActiveSupport::TestCase
  test 'page fixtures are valid' do
    assert pages(:index).valid?
    assert pages(:about).valid?
    assert pages(:contacts).valid?
  end

  test 'page requires name' do
    page = Page.new(title: 'Title')
    page.valid?
    assert page.errors[:name].any?
  end

  test 'page requires title' do
    page = Page.new(name: 'test')
    page.valid?
    assert page.errors[:title].any?
  end

  test 'description_filled returns emoji based on description presence' do
    page = pages(:index)
    page.description = 'Some description'
    assert_equal "\u2705", page.description_filled

    page.description = nil
    assert_equal "\u274C", page.description_filled
  end

  test 'keywords_filled returns emoji based on keywords presence' do
    page = pages(:index)
    page.keywords = 'some keywords'
    assert_equal "\u2705", page.keywords_filled

    page.keywords = nil
    assert_equal "\u274C", page.keywords_filled
  end
end
