# frozen_string_literal: true

class MarkdownRenderer
  EXTENSIONS = {
    autolink: true,
    fenced_code_blocks: true,
    tables: true,
    strikethrough: true,
    superscript: true,
    underline: true,
    no_intra_emphasis: true
  }.freeze

  RENDER_OPTIONS = {
    hard_wrap: true,
    link_attributes: { target: '_blank', rel: 'noopener noreferrer' }
  }.freeze

  def self.render(markdown_text)
    return '' if markdown_text.blank?

    renderer = Redcarpet::Render::HTML.new(RENDER_OPTIONS)
    markdown = Redcarpet::Markdown.new(renderer, EXTENSIONS)
    markdown.render(markdown_text).html_safe
  end
end
