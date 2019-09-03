# frozen_string_literal: true

class Blog < ApplicationRecord
  extend FriendlyId
  include Sluggable

  friendly_id :title, use: :slugged
  mount_uploader :preview_img, PreviewUploader

  validates :title, :preview, :preview_img, :content, presence: true

  def description_filled
    description.present? ? '✅' : '❌'
  end

  def keywords_filled
    keywords.present? ? '✅' : '❌'
  end
end
