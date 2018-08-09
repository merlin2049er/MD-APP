class InviteMailer < ApplicationMailer


  def invite_email(name, to, message)
    @name = name
    @message = message
    @to = to

    mail(from: 'no_reply@jginfosys.com', to: to,  subject: 'You have been invited...', message: message)
  end

end
