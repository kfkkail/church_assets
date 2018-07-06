# frozen_string_literal: true

class EmailMeMailer < ApplicationMailer
  def contact_form
    mail to: 'kfkkail@gmail.com', subject: 'Test Email'
  end
end
