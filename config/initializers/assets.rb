# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.

Rails.application.config.action_controller.asset_host = 'http://114.55.172.35/'

Rails.application.config.assets.precompile += %w( admin/login.css )
Rails.application.config.assets.precompile += %w( admin/login.js )
Rails.application.config.assets.precompile += %w( phone.js )
Rails.application.config.assets.precompile += %w( phone.css )
