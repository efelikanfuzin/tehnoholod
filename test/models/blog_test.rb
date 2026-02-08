# frozen_string_literal: true

require 'test_helper'

class BlogTest < ActiveSupport::TestCase
  test 'blog loaded from fixture has expected attributes' do
    blog = blogs(:one)
    assert_equal 'First Blog Post', blog.title
    assert_equal 'first-blog-post', blog.slug
  end

  test 'blog requires title' do
    blog = Blog.new(preview: 'text', content: 'text')
    blog.valid?
    assert blog.errors[:title].any?
  end

  test 'blog requires content' do
    blog = Blog.new(title: 'Title', preview: 'text')
    blog.valid?
    assert blog.errors[:content].any?
  end

  test 'blog requires preview' do
    blog = Blog.new(title: 'Title', content: 'text')
    blog.valid?
    assert blog.errors[:preview].any?
  end

  test 'description_filled returns emoji based on description presence' do
    blog = blogs(:one)
    blog.description = 'Some description'
    assert_equal "\u2705", blog.description_filled

    blog.description = nil
    assert_equal "\u274C", blog.description_filled
  end

  test 'keywords_filled returns emoji based on keywords presence' do
    blog = blogs(:one)
    blog.keywords = 'some keywords'
    assert_equal "\u2705", blog.keywords_filled

    blog.keywords = nil
    assert_equal "\u274C", blog.keywords_filled
  end

  test 'blog has friendly_id slug' do
    blog = blogs(:one)
    assert_not_nil blog.slug
    assert_not_empty blog.slug
  end
end
