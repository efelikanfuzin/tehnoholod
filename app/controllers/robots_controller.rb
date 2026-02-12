# frozen_string_literal: true

class RobotsController < ActionController::Base
  def show
    render plain: robots_content, content_type: 'text/plain'
  end

  private

  def robots_content
    if ENV['DISALLOW_INDEXING'].present?
      <<~ROBOTS
        User-agent: *
        Disallow: /
      ROBOTS
    else
      <<~ROBOTS
        User-agent: *
        Allow: /
        Disallow: /admin

        Sitemap: https://tehnoholod.ru/sitemap.xml
      ROBOTS
    end
  end
end
