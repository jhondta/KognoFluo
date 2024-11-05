# frozen_string_literal: true

# Application mailer
class ApplicationMailer < ActionMailer::Base
  default from: 'mailer@kognado.com'
  layout 'mailer'
end
