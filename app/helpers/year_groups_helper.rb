module YearGroupsHelper  
  def gender_count_to_chart_array(sessions, gender)
    start_date = Date.parse('2011-01-10')
    finish_date = Date.today
    date = start_date
    number_array = []
    while date < finish_date do
      count = sessions.joins(:student).where(:date => date..date+6.days, :students => {:gender => gender}).group('student_id').count.count
      number_array << count
      date += 6.days
    end
    return number_array.inspect
  end

  def reason_count_to_chart_array(sessions, reason_id)
    start_date = Date.parse('2011-01-10')
    finish_date = Date.today
    date = start_date
    number_array = []    
    while date < finish_date do
      count = sessions.where(:reason_id => reason_id, :date => date..date+6.days).group('student_id').count.count
      number_array << count
      date += 6.days
    end
    return number_array.inspect
  end
  
  def totals_per_week_group_ethnicities(year_group, ethnicities)
    start_date = Date.parse('2011-01-10')
    finish_date = Date.today
    ethnicities_array = []
    for ethnicity in ethnicities do
      date = start_date
      data = []    
      while date < finish_date do
        count = year_group.sessions.joins(:student).where(:students => {:ethnicity_id => ethnicity.id}, :date => date..date+6.days).group('student_id').count.count
        data << count
        date += 6.days
      end
      result = {:name => ethnicity.name, :data => data}
      ethnicities_array << result
    end
    return ethnicities_array.to_json
  end
  
end