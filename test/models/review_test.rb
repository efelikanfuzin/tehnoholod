# frozen_string_literal: true

require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  test 'review loaded from fixture has expected attributes' do
    review = reviews(:one)
    assert_equal 'Ivan Ivanov', review.full_name
    assert_equal 'Engineer', review.job
    assert review.show
  end

  test 'review requires full_name' do
    review = Review.new(job: 'Engineer', content: 'Good', photo: 'photo.jpg')
    review.valid?
    assert review.errors[:full_name].any?
  end

  test 'review requires job' do
    review = Review.new(full_name: 'Name', content: 'Good', photo: 'photo.jpg')
    review.valid?
    assert review.errors[:job].any?
  end

  test 'review requires content' do
    review = Review.new(full_name: 'Name', job: 'Engineer', photo: 'photo.jpg')
    review.valid?
    assert review.errors[:content].any?
  end

  test 'can_show scope returns only reviews with show true' do
    shown = Review.can_show
    assert shown.all? { |r| r.show == true }
    assert_includes shown, reviews(:one)
    assert_not_includes shown, reviews(:two)
  end
end
