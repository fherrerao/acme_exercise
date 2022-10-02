class GetData
  def self.data
    File.readlines('employees.txt').map { |line| line.split('=') }
  end
end
