# Class to get the time and convert it to DateTime
class DataDate
  def self.start_time(time)
    DateTime.parse(time[2..6])
  end

  def self.end_time(time)
    DateTime.parse(time[8..12])
  end
end
