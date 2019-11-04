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
  def nav_link_to(title:, url:, options: {})
    if url == "/#{current_page.path}"
      options[:aria] ||= {}
      options[:aria][:current] = "page"
    end

    link_to title, url, options
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
