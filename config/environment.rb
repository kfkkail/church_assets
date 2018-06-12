# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address => 'smtp.gmail.com',
  :port => 587,
  :user_name => 'kail.keusch@gmail.com',
  :password => ENV['GMAIL_PASSWORD'],
  :authentication => 'login',
  :enable_starttls_auto => true
}
