require 'date'
require './get_data'
require './data_date'

class Employee
  def initialize(data = GetData.data)
    @data = data

    # Objects array to store the employees and their schedules
    @employees = []

    # Array with the names of the employees to iterate between them
    @match_employees = []

    # Array with the names of the employees and the number of times they have coincided in the office
    @result = []

    # Variable to count the number of times two employees have coincided in the office
    @counter = 0
  end

  def convert_to_hash
    @data.to_h.each do |key, value|
      @employees.push(key => value.split(','))
      @match_employees.push(key)
    end
  end

  def coincidence(next_item, one_employee_day)
    two_employee_day = @employees[next_item][@match_employees[next_item]].filter do |element|
      element[0..1] == one_employee_day[0..1]
    end
    return if two_employee_day.empty?

    start_employee_one = DataDate.start_time(one_employee_day)
    end_employee_one = DataDate.end_time(one_employee_day)
    start_employee_two = DataDate.start_time(two_employee_day[0])
    end_employee_two = DataDate.end_time(two_employee_day[0])

    if start_employee_two.between?(start_employee_one, end_employee_one) ||
       start_employee_one.between?(start_employee_two, end_employee_two)
      @counter += 1
    end
  end

  def display_coincidences
    convert_to_hash

    # Iterate object arrays to match the employees
    (0..@match_employees.length - 1).each do |item|
      (item + 1..@match_employees.length - 1).each do |next_item|
        # Getting the schedules given by the employees (employees[i]['employee_name'])
        @employees[item][@match_employees[item]].each do |one_employee_day|
          coincidence(next_item, one_employee_day)
        end
        @result.push("#{@match_employees[item]}-#{@match_employees[next_item]}:#{@counter}")
        @counter = 0
      end
    end
    @result.each { |element| p element }
  end
end

Employee.new.display_coincidences
