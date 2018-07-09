# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: "'Church Assets' <kail.keusch@gmail.com>"
  layout 'mailer'
end
