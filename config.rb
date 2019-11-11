# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

helpers do
  def current_url?(url)
    url == "/#{current_page.path}"
  end

  def wrapped_nav_link_to(title:, url:, options: {})
    if current_url?(url)
      options[:aria] ||= {}
      options[:aria][:current] = "page"
      wrapper_class = "current"
    else
      wrapper_class = "other"
    end

    content_tag :li, class: wrapper_class do
      link_to title, url, options
    end
  end

  def issues
    app.sitemap.resources.select do |resource|
      resource.path.start_with?("issues/")
    end.sort_by do |resource|
      resource.data.order
    end
  end
end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

# pretty URLs (`/foo/` instead of `/foo.html`)
activate :directory_indexes

configure :build do
  activate :asset_hash
  activate :minify_css
  activate :minify_javascript
end

configure :staging do
  config[:google_analytics_key] = "UA-151307154-1"
end

configure :production do
  config[:google_analytics_key] = "UA-151307154-2"
end
