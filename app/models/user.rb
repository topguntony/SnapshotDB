class User < ActiveRecord::Base
  acts_as_authentic  do |c|
    c.validates_confirmation_of_password_field_options = {:on => :update}
    c.validates_length_of_password_field_options = {:on => :update, :minimum => 6}
  end
  
  after_create :send_activation_email
  
  private
  
  def send_activation_email
    UserMailer.welcome(self).deliver
  end
end
