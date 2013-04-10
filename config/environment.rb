# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
TeamRosterApp::Application.initialize!

TeamRosterApp::Application.configure do
	config.action_mailer.raise_delivery_errors = true
	config.action_mailer.delivery_method = :smtp
	config.action_mailer.perform_deliveries = true

end