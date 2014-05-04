require 'rails/railtie'

module Eye
  class Railtie < Rails::Railtie
    # Store all configuration pertaining to the app in config.eye
    config.eye = ActiveSupport::OrderedOptions.new

    # Including AWS..
    config.eye.aws = ActiveSupport::OrderedOptions.new
  end
end
