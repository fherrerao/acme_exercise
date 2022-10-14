class GetData
  # Method to get the data from the file and separate the name from the schedule
  def self.data
    File.readlines('employees.txt').map { |line| line.split('=') }.to_h
  end
end
