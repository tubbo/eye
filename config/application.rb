$LOAD_PATH << File.expand_path('../../lib', __FILE__)

require File.expand_path('../boot', __FILE__)

require "rails"
require "eye"

%w(
  active_record
  action_controller
  action_view
  action_mailer
  sprockets
).each do |framework|
  begin
    require "#{framework}/railtie"
  rescue LoadError
  end
end

# Require the gems listed in Gemfile
Bundler.require :default, Rails.env

module Eye
  class Application < Rails::Application
    # Use EST as our local time zone. (UTC is default)
    config.time_zone = 'Eastern Time (US & Canada)'

    # Use annotated Ember.js
    config.ember.variant = :development

    # Use localhost as mail server (for Devise)
    config.action_mailer.default_url_options = { host: 'localhost:3000' }

    # Amazon Web Services configuration
    config.eye.aws.access_key_id = ENV['AWS_ACCESS_KEY_ID']
    config.eye.aws.secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']
    config.eye.aws.cdn_distro_id = ENV['CDN_DISTRIBUTION_ID']
  end
end
