class UserSession < Authlogic::Session::Base
  
  def self.find_by_username_or_email(login)
    find_by_email(login) || find_by_username(login)
  end
  
  def to_key
     new_record? ? nil : [ self.send(self.class.primary_key) ]
  end
  
  def persisted?
    false
  end
end