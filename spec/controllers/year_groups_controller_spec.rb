require 'spec_helper'

describe YearGroupsController do
  context "#index" do
    before(:each) do
      log_in
      YearGroup.should_receive(:all)
      get :index
    end
    
    it { should respond_with(:success) }
    it { should assign_to(:year_groups) }
  end
end
