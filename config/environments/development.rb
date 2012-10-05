DoorkeeperDeviseClient::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request.  This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  #config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Do not compress assets
  config.assets.compress = false
 
  # Expands the lines which load the assets
  config.assets.debug = true
#TODO #DEVISE modifications
config.action_mailer.delivery_method = :letter_opener
config.action_mailer.perform_deliveries = true
config.action_mailer.raise_delivery_errors = true
config.action_mailer.default_url_options = { :host => 'localhost:3000' }
  ##config.action_mailer.delivery_method = :smtp

  config.action_mailer.smtp_settings = {
    :enable_starttls_auto => true,
    :address => "smtp.gmail.com",
    :port => 587,
    :domain => "gmail.com",
    :authentication => :login,
    :user_name => "john@triplingo.com",
    :password => "jesserocks",
  }
  
##TODO !!NEW seed data -- please update the following in the
##development.rb  -john
DOORKEEPER_APP_ID = "f9bdae4f5925299e041d3d5be4a9deb7e66294472f214190fade3c2ae5b75045"
DOORKEEPER_APP_SECRET = "4fb3fab41f07065acad7f19e10646a807f8d7f4e0a69f6f3ac000f4c5f9bdf05"
DOORKEEPER_APP_URL = "http://localhost:4000"
end
