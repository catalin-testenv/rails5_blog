# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
Rails.application.config.assets.paths << File.join(Rails.root, "app/themes/#{ENV['APP_THEME']}/assets/stylesheets")
Rails.application.config.assets.paths << File.join(Rails.root, "app/themes/#{ENV['APP_THEME']}/assets/javascripts")
Rails.application.config.assets.paths << File.join(Rails.root, "app/themes/#{ENV['APP_THEME']}/assets/images")
Rails.application.config.assets.paths << File.join(Rails.root, "app/themes/#{ENV['APP_THEME']}/vendor")


# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( **/*.jpg )
Rails.application.config.assets.precompile += %w(
  site_front.*
  site_admin.*

  ace/*
  tinymce/*
)

# Extend Sass.load_paths
# Sass.load_paths << File.join(Rails.root, '/path')


