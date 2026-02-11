# frozen_string_literal: true

namespace :blogs do
  desc 'Migrate blog posts from database to markdown files'
  task migrate_to_markdown: :environment do
    require 'yaml'
    require 'fileutils'

    output_dir = Rails.root.join('content', 'blogs')
    FileUtils.mkdir_p(output_dir)

    # Directly query the database since Blog model is no longer ActiveRecord
    blogs = ActiveRecord::Base.connection.execute('SELECT * FROM blogs ORDER BY created_at DESC')

    if blogs.empty?
      puts 'No blog posts found in database.'
      next
    end

    puts "Found #{blogs.length} blog posts. Migrating..."

    blogs.each do |row|
      title = row['title']
      created_at = row['created_at'] ? Time.parse(row['created_at']) : Time.current
      date_str = created_at.strftime('%Y-%m-%d')

      slug = row['slug'].presence || title.to_s.parameterize
      filename = "#{date_str}-#{slug}.md"
      filepath = output_dir.join(filename)

      front_matter = {
        'title' => title,
        'preview' => row['preview'],
        'preview_img' => row['preview_img'].to_s,
        'slug' => slug,
        'keywords' => row['keywords'].to_s,
        'description' => row['description'].to_s,
        'created_at' => created_at.iso8601,
        'updated_at' => (row['updated_at'] ? Time.parse(row['updated_at']).iso8601 : created_at.iso8601)
      }

      content = row['content'].to_s

      File.write(filepath, "---\n#{front_matter.to_yaml.sub("---\n", '')}---\n\n#{content}")
      puts "  Created: #{filename}"
    end

    puts "\nMigration complete! #{blogs.length} posts saved to #{output_dir}"
    puts 'Note: Content was migrated as-is (HTML). You may want to convert it to Markdown.'
  end
end
