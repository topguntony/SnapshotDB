class UserMailer < ActionMailer::Base
  default :from => "gdrummond.317@lgflmail.org"
  
  def welcome(user)
    @user = user
    mail(:to => user.email, :subject => "On Call and Learning Zone Logs")
  end
end
