# frozen_string_literal: true

# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  address: 'email-smtp.us-east-1.amazonaws.com',
  port: 587,
  user_name: 'AKIAJ3RWIWXJZFW25KSA',
  password: 'Amd0al12OtKTygEATpKYAyUKfNsqq12sZ7QWpRvNbca6',
  authentication: :login,
  enable_starttls_auto: true
}
