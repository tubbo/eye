require 'rails/railtie'

module Eye
  class Railtie < Rails::Railtie
    config.eye = ActiveSupport::OrderedOptions.new
  end
end
