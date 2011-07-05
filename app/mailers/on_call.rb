class OnCall < ActionMailer::Base
  default :from => "gdrummond.317@lgflmail.org"
  
  def daily(logs)
    @logs = logs
    to = []
    for user in User.all do
      to << user.email
    end
      
    mail(:to => to, :subject => "On Calls - #{Date.today}")
  end
end
