namespace :import do
  
  desc "Import LZ Sessions"
  task :learning_zone_sessions => :environment do
    
  end
  
  desc "Import Staff"
  task :staff => :environment do
    FasterCSV.foreach('db/seed_data/staff.csv') do |row|
      if row[3]
        referrer = true
      else
        referrer = false
      end
      staff = Staff.new(:first_name => row[0], :last_name => row[1], :salutation => row[2], :referrer => referrer)
      staff.save
    end
  end
  
  desc "Import students"
  task :students => :environment do
    FasterCSV.foreach('db/seed_data/pupils.csv') do |row|
      year_group = YearGroup.find_or_create_by_name(:name => row[3])
      house = House.find_or_create_by_name(:name => row[4])
      student = Student.new(:upn => row[0], :first_name => row[1], :last_name => row[2], :year_group => year_group, :house => house)
      student.save
    end
  end
end