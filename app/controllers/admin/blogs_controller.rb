# frozen_string_literal: true

module Admin
  class BlogsController < ActionController::Base
    before_action :authenticate_user!
    layout 'admin'

    def index
      @blogs = Blog.all
    end

    def show
      @blog = Blog.friendly.find(params[:id])
    end

    def new
      @blog = Blog.new(created_at: Time.current)
    end

    def create
      @blog = Blog.new(blog_params)
      @blog.created_at ||= Time.current
      @blog.slug = generate_slug(@blog.title) if @blog.slug.blank?

      if @blog.title.present? && @blog.content.present? && @blog.save
        redirect_to admin_blog_path(@blog.slug), notice: 'Статья создана'
      else
        render :new
      end
    end

    def edit
      @blog = Blog.friendly.find(params[:id])
    end

    def update
      @blog = Blog.friendly.find(params[:id])
      old_path = @blog.file_path

      blog_params.each { |k, v| @blog.send(:"#{k}=", v) }
      @blog.slug = generate_slug(@blog.title) if @blog.slug.blank?

      if @blog.save
        File.delete(old_path) if old_path && old_path != @blog.file_path && File.exist?(old_path)
        redirect_to admin_blog_path(@blog.slug), notice: 'Статья обновлена'
      else
        render :edit
      end
    end

    def destroy
      blog = Blog.friendly.find(params[:id])
      blog.destroy
      redirect_to admin_blogs_path, notice: 'Статья удалена'
    end

    private

    def blog_params
      params.require(:blog).permit(:title, :preview, :content, :preview_img, :slug, :keywords, :description)
    end

    def generate_slug(title)
      title.to_s.to_slug.normalize(transliterations: :russian).to_s
    end

    def authenticate_user!
      redirect_to root_path unless current_user
    end

    def current_user
      @current_user ||= if defined?(super)
                           super
                         else
                           env['warden']&.authenticate(scope: :user)
                         end
    end
    helper_method :current_user
  end
end
