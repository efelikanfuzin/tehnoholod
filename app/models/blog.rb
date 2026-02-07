# frozen_string_literal: true

class Blog < ApplicationRecord
  extend FriendlyId
  include Sluggable
  include PgSearch::Model

  friendly_id :title, use: :slugged
  mount_uploader :preview_img, PreviewUploader

  validates :title, :preview, :preview_img, :content, presence: true

  pg_search_scope :search_by_title_and_content, against: [:title, :content],
                                                using: {
                                                  tsearch: { prefix: true }
                                                }

  def description_filled
    description.present? ? '✅' : '❌'
  end

  def keywords_filled
    keywords.present? ? '✅' : '❌'
  end
end
