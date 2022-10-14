require 'date'
require './get_data'


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
    @data.each do |key, value|
      @match_employees.push(key)
    end
  end

  def display_coincidences    
    convert_to_hash
    
    @match_employees = @match_employees.repeated_combination(2).to_a
    @match_employees.each do |employee|
      next if employee[0] == employee[1]
      @data[employee[0]].split(',').each do |item|
        
        employee_two = @data[employee[1]].split(',').filter {|item_2| item_2[0..1] == item[0..1]}  
        next if employee_two.empty?
        employee_two[0][2..6].between?(item[2..6], item[8..12]) || 
        item[2..6].between?(employee_two[0][2..6], employee_two[0][8..12]) ? 
        @counter += 1 : next
      end
      p "#{employee[0]}-#{employee[1]} #{@counter}"
      @counter = 0
    end
    
  end 
end

Employee.new.display_coincidences
