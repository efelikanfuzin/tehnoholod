return if ENV['DISALLOW_INDEXING'].present?

SitemapGenerator::Sitemap.default_host = 'https://tehnoholod.ru'
SitemapGenerator::Sitemap.compress = false

SitemapGenerator::Sitemap.create do
  add about_path, priority: 1.0, changefreq: 'monthly'
  add contacts_path, priority: 1.0, changefreq: 'monthly'

  add products_path, priority: 1.0, changefreq: 'weekly'
  Product.find_each do |product|
    add product_path(product), priority: 0.8, changefreq: 'monthly', lastmod: product.updated_at
  end

  add projects_path, priority: 1.0, changefreq: 'weekly'
  Project.find_each do |project|
    add project_path(project), priority: 0.8, changefreq: 'monthly'#, lastmod: project.updated_at
  end

  add blogs_path, priority: 1.0, changefreq: 'weekly'
  Blog.all.each do |blog|
    add blog_path(blog), priority: 0.8, changefreq: 'monthly', lastmod: blog.updated_at
  end

  add stocks_path, priority: 1.0, changefreq: 'weekly'
  Stock.find_each do |stock|
    add stock_path(stock), priority: 0.8, changefreq: 'monthly', lastmod: stock.updated_at
  end
end
