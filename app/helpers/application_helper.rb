module ApplicationHelper
  def fetch_passing_time(sending_time)
    passing_time = sending_time.to_time - Time.now.to_time
    return "#{passing_time}時間前"
  end
end
