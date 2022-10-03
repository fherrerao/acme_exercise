require './get_data'

RSpec.describe GetData do
  context 'When testing the GetData class' do
    it 'the data method should read the .txt file' do
      expect(GetData.data).to eq(
        [
          ['RENE', "MO10:00-12:00,TU10:00-12:00,TH01:00-03:00,SA14:00-18:00,SU20:00-21:00\n"],
          ['ASTRID', "MO10:00-12:00,TH12:00-14:00,SU20:00-21:00\n"],
          ['ANDRES', "MO10:00-12:00,TH12:00-14:00,SU20:00-21:00\n"],
          ['JUAN', "MO10:15-12:00,TU10:00-12:00,TH13:00-13:15,SA14:00-18:00,SU20:00-21:00\n"],
          ['CARO', "MO10:00-12:00,TH12:00-14:00,SU20:00-21:00\n"]
        ]
      )
    end
  end
end
