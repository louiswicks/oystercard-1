require 'station'

describe Station do

  describe '#name' do

    it "will return the station's name" do
      station = Station.new('station', 1)
      expect(station.name).to eq 'station'
    end
  end

  describe '#zone' do
    it "will return the station's zone" do
      station = Station.new('station', 1)
      expect(station.zone).to eq 1
    end
  end

end
