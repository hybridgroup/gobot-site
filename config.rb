require 'rack/codehighlighter'
require "coderay"

use Rack::GoogleAnalytics, :tracker => 'UA-46433484-3', :domain => 'gobot.io'

use Rack::Codehighlighter, :coderay, :markdown => true,
  :element => "pre>code", :pattern => /\A:::(\w+)\s*\n/

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

activate :blog do |blog|
  blog.prefix = "blog"
  blog.layout = "blog"
  blog.tag_template = "blog/tag.html"
end

page "/blog/feed.xml", layout: false

activate :directory_indexes
activate :neat
activate :livereload

configure :build do
end

helpers do
  def menu_item(path)
    properties = {:href => "/#{path}", :class => "item"}

    if current_page.path == path
      properties[:class] = "active item"
    end

    properties
  end

  def article_author(article)
    article.data.author || "Staff"
  end

end
