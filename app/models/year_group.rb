class YearGroup < ActiveRecord::Base
  has_many :students
  has_many :sessions, :through => :students
end
