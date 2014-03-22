require 'eye/config_menu'
require 'eye/railtie'

# Extra code for the application.

module Eye
  def self.config
    Rails.application.config.eye
  end
end
