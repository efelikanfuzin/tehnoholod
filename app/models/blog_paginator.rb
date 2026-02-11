# frozen_string_literal: true

class BlogPaginator
  include Enumerable

  attr_reader :current_page, :per_page_count, :collection

  delegate :each, :[], :size, :length, :empty?, to: :paginated_collection

  def initialize(collection, page = nil)
    @collection = collection
    @current_page = (page || 1).to_i
    @current_page = 1 if @current_page < 1
    @per_page_count = 5
  end

  def per(count)
    @per_page_count = count
    self
  end

  def order(options = {})
    if options[:id] == :desc || options[:created_at] == :desc
      @collection = @collection.sort_by(&:created_at).reverse
    elsif options[:id] == :asc || options[:created_at] == :asc
      @collection = @collection.sort_by(&:created_at)
    end
    self
  end

  def page(page_num)
    @current_page = (page_num || 1).to_i
    @current_page = 1 if @current_page < 1
    self
  end

  def total_pages
    (collection.size.to_f / per_page_count).ceil
  end

  def total_count
    collection.size
  end

  def limit_value
    per_page_count
  end

  def offset_value
    (current_page - 1) * per_page_count
  end

  def last_page?
    current_page >= total_pages
  end

  def first_page?
    current_page == 1
  end

  def num_pages
    total_pages
  end

  def entry_name(options = {})
    'записей'
  end

  def max_pages
    nil
  end

  private

  def paginated_collection
    @collection[offset_value, per_page_count] || []
  end
end
