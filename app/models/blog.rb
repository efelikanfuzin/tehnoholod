# frozen_string_literal: true

require 'yaml'
require 'redcarpet'

class Blog
  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveModel::Serialization

  CONTENT_DIR = Rails.root.join('content', 'blogs')

  attribute :id, :integer
  attribute :title, :string
  attribute :preview, :string
  attribute :content, :string
  attribute :preview_img, :string
  attribute :slug, :string
  attribute :keywords, :string
  attribute :description, :string
  attribute :created_at, :datetime
  attribute :updated_at, :datetime

  class << self
    def all
      load_all_posts
    end

    def count
      markdown_files.size
    end

    def friendly
      self
    end

    def find(slug_or_id)
      post = if slug_or_id.to_s.match?(/\A\d+\z/)
               all.find { |p| p.id == slug_or_id.to_i }
             else
               all.find { |p| p.slug == slug_or_id.to_s }
             end
      post || raise(ActiveRecord::RecordNotFound, "Blog post not found: #{slug_or_id}")
    end

    def page(page_num)
      BlogPaginator.new(all, page_num)
    end

    def search_by_title_and_content(query)
      return all if query.blank?

      q = query.downcase
      all.select do |post|
        post.title.to_s.downcase.include?(q) || post.content.to_s.downcase.include?(q)
      end
    end

    def last(n = 1)
      posts = all.first(n)
      n == 1 ? posts.first : posts
    end

    private

    def markdown_files
      Dir.glob(CONTENT_DIR.join('*.md')).sort.reverse
    end

    def load_all_posts
      markdown_files.each_with_index.map do |file, index|
        parse_markdown_file(file, index + 1)
      end
    end

    def parse_markdown_file(file_path, default_id)
      raw = File.read(file_path)
      if raw =~ /\A---\s*\n(.*?\n?)^---\s*\n/m
        front_matter = YAML.safe_load(::Regexp.last_match(1), permitted_classes: [Date, Time, DateTime])
        body = ::Regexp.last_match.post_match
      else
        front_matter = {}
        body = raw
      end

      basename = File.basename(file_path, '.md')
      date_match = basename.match(/\A(\d{4}-\d{2}-\d{2})-(.+)\z/)
      file_date = date_match ? Date.parse(date_match[1]) : File.mtime(file_path)
      file_slug = date_match ? date_match[2] : basename

      Blog.new(
        id: front_matter['id'] || default_id,
        title: front_matter['title'] || file_slug.tr('-', ' ').capitalize,
        preview: front_matter['preview'] || body.strip[0..300],
        content: body.strip,
        preview_img: front_matter['preview_img'] || '',
        slug: front_matter['slug'] || file_slug,
        keywords: front_matter['keywords'] || '',
        description: front_matter['description'] || '',
        created_at: front_matter['created_at'] || file_date.to_time,
        updated_at: front_matter['updated_at'] || File.mtime(file_path)
      )
    end
  end

  def to_param
    slug
  end

  def persisted?
    true
  end

  def to_key
    [slug]
  end

  def model_name
    ActiveModel::Name.new(self.class, nil, 'Blog')
  end

  def rendered_content
    MarkdownRenderer.render(content)
  end

  def preview_img_url(version = nil)
    return nil if preview_img.blank?

    preview_img
  end

  def description_filled
    description.present? ? '✅' : '❌'
  end

  def keywords_filled
    keywords.present? ? '✅' : '❌'
  end

  def slice(*keys)
    keys.each_with_object({}) do |key, hash|
      hash[key] = send(key) if respond_to?(key)
    end
  end

  def file_path
    matching = Dir.glob(CONTENT_DIR.join("*-#{slug}.md")) + Dir.glob(CONTENT_DIR.join("#{slug}.md"))
    matching.first
  end

  def save
    date_str = (created_at || Time.current).strftime('%Y-%m-%d')
    filename = "#{date_str}-#{slug}.md"
    path = CONTENT_DIR.join(filename)

    front_matter = {
      'title' => title,
      'preview' => preview,
      'preview_img' => preview_img,
      'slug' => slug,
      'keywords' => keywords,
      'description' => description,
      'created_at' => created_at&.iso8601,
      'updated_at' => Time.current.iso8601
    }.compact

    File.write(path, "---\n#{front_matter.to_yaml.sub("---\n", '')}---\n\n#{content}")
    true
  end

  def update(attrs)
    attrs.each { |k, v| send(:"#{k}=", v) }
    save
  end

  def destroy
    path = file_path
    File.delete(path) if path && File.exist?(path)
    true
  end
end
