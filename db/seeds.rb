=begin
reasons = [
  {:name => "Personal Timetable", :code => "PT", :color => "#4572A7"}, 
  {:name => "On Call", :code => "OC", :color => "#AA4643"}, 
  {:name => "Exclusion", :code => "E", :color => "#89A54E"}, 
  {:name => "Mentoring", :code => "M", :color => "#80699B"}, 
  {:name => "LZ Transfer", :code => "LZT", :color => "#3D96AE"},
  {:name => "Retracking", :code => "RT", :color => "#B5CA92"}
]

puts "Populating Reasons"
Reason.create(reasons)

puts "Populating Staff"
FasterCSV.foreach('db/seed_data/staff.csv') do |row|
  if row[3]
    referrer = true
  else
    referrer = false
  end
  staff = Staff.new(:first_name => row[0], :last_name => row[1], :salutation => row[2], :referrer => referrer)
  staff.save
end

puts "Populating Students"
FasterCSV.foreach('db/seed_data/pupils.csv') do |row|
  year_group = YearGroup.find_or_create_by_name(:name => row[3])
  house = House.find_or_create_by_name(:name => row[4])
  student = Student.new(:upn => row[0], :first_name => row[1], :last_name => row[2], :year_group => year_group, :house => house)
  student.save
end

puts "Populating Additional Student Data"
FasterCSV.foreach('db/seed_data/pupil_details.csv') do |row|
  student = Student.find_by_upn(row[0])
  student.ethnicity = Ethnicity.find_or_create_by_name(:name => row[3])
  student.gender = row[1]
  
  if row[2] == "Y"
    free_school_meals = true
  else
    free_school_meals = false
  end
  
  student.free_school_meals = free_school_meals
  student.save
end

puts "Importing Register"
FasterCSV.foreach('db/seed_data/old_register.csv') do |row|  
  student = Student.find_by_upn(row[1])
  
  date = row[0]
  reason_id = row[8]
  referrer_id = row[11]
  staff_id = row[10]
  
  #Set the subject
  if row[9]
    subject = Subject.find_or_create_by_name(:name => row[9])
  else
    subject = nil
  end
  
  #Period 1
  if row[3]
    session = student.sessions.new(:period => 1, :date => date, :reason_id => reason_id, :subject => subject, :staff_id => staff_id, :referrer_id => referrer_id)
    session.save
  end
  
  #Period 2
  if row[4]
    session = student.sessions.new(:period => 2, :date => date, :reason_id => reason_id, :subject => subject, :staff_id => staff_id, :referrer_id => referrer_id)
    session.save
  end
  
  #Period 3
  if row[5]
    session = student.sessions.new(:period => 3, :date => date, :reason_id => reason_id, :subject => subject, :staff_id => staff_id, :referrer_id => referrer_id)
    session.save
  end
  
  #Period 4
  if row[6]
    session = student.sessions.new(:period => 4, :date => date, :reason_id => reason_id, :subject => subject, :staff_id => staff_id, :referrer_id => referrer_id)
    session.save
  end
  
  #Period 5
  if row[7]
    session = student.sessions.new(:period => 5, :date => date, :reason_id => reason_id, :subject => subject, :staff_id => staff_id, :referrer_id => referrer_id)
    session.save
  end
end

puts "Creating Users"
User.create!(:email => "gdrummond.317@lgflmail.org", :admin => true, :can_admin => true)
puts "Populating Behaviour Log"
FasterCSV.foreach('db/seed_data/behaviour_logs.csv') do |row|
  #puts row[0]
  student = Student.find_by_upn(row[1])
  behaviour_reason = BehaviourReason.find_or_create_by_name(:name => row[3])
  behaviour_outcome = BehaviourOutcome.find_or_create_by_name(:name => row[2])
  location = Location.find_or_create_by_name(:name => row[4])  
  period = row[5]
  staff = Staff.find(:first, :conditions =>{:first_name => row[7], :last_name => row[6]})
  unless staff
    staff = Staff.create(:first_name => row[7], :last_name => row[6])
  end
  behaviour_log = student.behaviour_logs.new(:date => row[0], :behaviour_reason_id => behaviour_reason.id, :behaviour_outcome_id => behaviour_outcome.id, :staff_id => staff.id, :location_id => location.id, :period => period)
  behaviour_log.save
end
=end


puts "loading exclusions"

FasterCSV.foreach('db/seed_data/exclusions.csv') do |row|
  student = Student.find_by_upn(row[1])
  exclusion = Exclusion.new(
    :student_id => student.id,
    :length => row[3],
    :date => row[0],
    :effective_dates => row[4],
    :reason => row[5]
  )
  exclusion.save
end
