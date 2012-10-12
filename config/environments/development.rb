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
end

DOORKEEPER_APP_ID = "2613487dc7edf3871c015b9df1f2ded421e277a3631e6d763d90b4b77452793b"
DOORKEEPER_APP_SECRET = "62cc3d569a6d7225a8dd974871a700b24ee977bffaf16ad4634aba16ec6058f9"
DOORKEEPER_APP_URL = "http://localhost:4000"
