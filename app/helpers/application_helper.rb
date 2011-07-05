module ApplicationHelper
    
  def title(title)
    content_for(:title){ title }
  end
  
  def tab(tab)
    content_for(:tab){tab}
  end
  
  def sessions_to_chart_array(sessions)
    start_date = Date.parse('2011-01-10')
    finish_date = Date.today
    date = start_date
    sessions_array = []
    while date < finish_date do
      sessions_array << sessions.total_on_week_starting(date)
      date += 7.days
    end
    return sessions_array.to_a.inspect
  end
  
  def students_to_chart_array(sessions)
    start_date = Date.parse('2011-01-10')
    finish_date = Date.today
    date = start_date
    students_array = []
    while date < finish_date do
      students_array << sessions.where(:date => date..date+6.days).group('student_id').count.count
      date += 7.days
    end
    return students_array.to_a.inspect
  end
  
  def dates_for_chart
    start_date = Date.parse('2011-01-10')
    finish_date = Date.today
    date = start_date
    dates = []
    while date < finish_date do
      dates << "#{date.strftime('%d/%m/%Y')}"
      date += 7.days
    end
    return dates.to_a.inspect
  end
  
  def group_sessions_by_period(sessions, reason_id)
    periods = [1, 2, 3, 4, 5]
    values = []
    for period in periods
      n = sessions.where(:period => period, :reason_id => reason_id).count
      values << n
    end
    return values.to_a.inspect
  end
  
  def periods_for_chart
    return [1, 2, 3, 4, 5].to_a.inspect
  end
end
