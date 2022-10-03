require 'date'
require './data_date'

RSpec.describe DataDate do
  describe '#start_time' do
    it 'returns the start time of the employee' do
      expect(DataDate.start_time('MO10:00-12:00')).to eq(DateTime.parse('10:00'))
    end
  end

  describe '#end_time' do
    it 'returns the end time of the employee' do
      expect(DataDate.end_time('MO10:00-12:00')).to eq(DateTime.parse('12:00'))
    end
  end
end
