class GetData
  # Method to get the data from the file and separate the name from the schedule
  def self.data
    File.readlines('employees.txt').to_h { |line| line.split('=') }
  end
end
