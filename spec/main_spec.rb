require './main'

RSpec.describe Employee do
  describe '#employee_schedules' do
    it 'returns the number of times two employees have coincided in the office' do
      expect(Employee.new.display_coincidences).to eq(
        [
          'RENE-ASTRID:2',
          'RENE-ANDRES:2',
          'RENE-JUAN:4',
          'RENE-CARO:2',
          'ASTRID-ANDRES:3',
          'ASTRID-JUAN:3',
          'ASTRID-CARO:3',
          'ANDRES-JUAN:3',
          'ANDRES-CARO:3',
          'JUAN-CARO:3'
        ]
      )
    end
  end
end
