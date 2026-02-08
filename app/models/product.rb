# frozen_string_literal: true

class Product < ApplicationRecord
  extend FriendlyId
  include Sluggable

  friendly_id :title, use: :slugged
  enum :products_type, %i[public_catering furniture store_items]
  mount_uploader :avatar, PreviewUploader

  validates :title, :description, :avatar, :products_type, presence: true

  def description_filled
    meta_description.present? ? '✅' : '❌'
  end

  def keywords_filled
    meta_keywords.present? ? '✅' : '❌'
  end
end
