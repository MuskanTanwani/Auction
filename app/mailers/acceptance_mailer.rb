class AcceptanceMailer < ApplicationMailer
   
  def acceptance_mailer(email)
     @url  = 'http://www.gmail.com'
     mail to: email, subject: 'Your Item has been purchased!'
  end

end
