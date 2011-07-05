require 'spec_helper'

describe StaffController do
  context ":index" do
    before(:each) do
      log_in
      Staff.should_receive(:all)
      get :index
    end
    
    it { should assign_to(:staff) }
  end
end
