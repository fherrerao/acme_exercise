require 'date'
require './get_data'
require './data_date'

# Object array to store the employees and their schedules
employees = []

# Array with the names of the employees to iterate between them
match_employees = []

# Array to store the result with the names of the employees and the number of times they have coincided in the office
result = []

# Variable to count the number of times two employees have coincided in the office
counter = 0

# Get the data from the file and convert it to a hash
GetData.data.to_h.each do |key, value|
  employees.push(key => value.split(','))
  match_employees.push(key)
end

(0..match_employees.length-1).each do |i|
  (i + 1..match_employees.length-1).each do |k|
    
    employees[i][match_employees[i]].each do |day|
      selected_day = employees[k][match_employees[k]].filter { |element| element[0..1] == day[0..1] }
      next unless selected_day.length.positive?

      start_employee_one = DataDate.start_time(day)
      end_employee_one = DataDate.end_time(day)
      start_employee_two = DataDate.start_time(selected_day[0])
      end_employee_two = DataDate.end_time(selected_day[0])

      if start_employee_two.between?(start_employee_one, end_employee_one) ||
        start_employee_one.between?(start_employee_two, end_employee_two)
        counter += 1
      end
    end
    result.push("#{match_employees[i]}-#{match_employees[k]}:#{counter}")
    counter = 0
  end
end
result.each { |element| p element }
