# frozen_string_literal: true

class ContactMailer < ActionMailer::Base
  default to: 'jguerra@jginfosys.com'

  def contact_email(name, email, message, registered_user, supplier)

    @name = name
    @email = email
    @message = message
    @registered_user = registered_user
    @supplier = supplier


    mail(from: email, subject: 'Enquiry message from Massdump')
  end
end
