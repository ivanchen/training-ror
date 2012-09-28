class UserMailer < ActionMailer::Base
  default from: "eifion@asciicasts.com"

  def registration_confirmation(user)
    @user = user
    mail(:to => user.email, :subject => "Registered", :from => "bla2@bla2.com")
   end
end
