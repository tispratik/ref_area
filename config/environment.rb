RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|

  config.action_controller.use_accept_header = true
  config.active_record.colorize_logging = false
  config.active_record.timestamped_migrations = false
  
  config.time_zone = 'UTC'
  config.gem 'fastercsv'
end


ActiveSupport::CoreExtensions::Time::Conversions::DATE_FORMATS[:default] = "%B %d, %Y %H:%M"
ActiveSupport::CoreExtensions::Date::Conversions::DATE_FORMATS[:default] = '%m/%d/%Y'