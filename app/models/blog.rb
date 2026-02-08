# frozen_string_literal: true

class Blog < ApplicationRecord
  extend FriendlyId
  include Sluggable
  friendly_id :title, use: :slugged
  mount_uploader :preview_img, PreviewUploader

  validates :title, :preview, :preview_img, :content, presence: true

  scope :search_by_title_and_content, ->(query) {
    where("title LIKE :q OR content LIKE :q", q: "%#{sanitize_sql_like(query)}%")
  }

  def description_filled
    description.present? ? '✅' : '❌'
  end

  def keywords_filled
    keywords.present? ? '✅' : '❌'
  end
end
