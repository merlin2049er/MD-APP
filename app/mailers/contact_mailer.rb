class ContactMailer < ActionMailer::Base
 default to: "jguerra@jginfosys.com"

 def contact_email(name, email, message)
 @name = name
 @email = email
 @message = message

 mail(from: email, subject: 'Enquiry message from Massdump')
 end
end