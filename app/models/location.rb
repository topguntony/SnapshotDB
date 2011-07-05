class Location < ActiveRecord::Base
  has_many :behaviour_logs
end
