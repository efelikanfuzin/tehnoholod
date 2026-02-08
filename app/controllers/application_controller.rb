# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_meta_information, :redirect_subdomain
  layout 'application'

  private

  def not_found
    raise ActionController::RoutingError, 'Not Found'
  end

  def set_meta_information
    page = Page.find_by(name: "#{params[:controller]}_#{params[:action]}")
    set_meta_tags title: page.try(:title),
                  description: page.try(:description),
                  keywords: page.try(:keywords),
                  og: {
                    site_name: 'ТехноХолод',
                    locale: 'ru_RU'
                  }
  end

  def redirect_subdomain
    domain_parts = request.host.split('.')

    return unless domain_parts.first == 'www'

    redirect_to(request.original_url.gsub('www.', ''), status: :moved_permanently) and return
  end

  def id_not_slug?
    params[:id].to_i.positive?
  end
end
