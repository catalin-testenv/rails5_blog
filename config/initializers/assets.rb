# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << File.join(Rails.root, '/bower_components/foundation-sites/js')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( **/*.jpg )

# Extend Sass.load_paths from ENV
ENV['SASS_LOAD_PATHS'].split(':').each do |path|
  Sass.load_paths << File.join(Rails.root, path)
end

