require 'journey'

describe Journey do
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }

  it "initializes entry_station as nil" do
    expect(subject.entry_station).to eq nil
  end

  it 'initializes entry_station' do
    journey = Journey.new(entry_station)
    expect(journey.entry_station).to eq entry_station
  end

  describe '#fare' do
    it 'method should return MINIMUM_FARE' do
      start_journey = Journey.new(entry_station)
      start_journey.finish(exit_station)
      expect(start_journey.fare).to eq Journey::MINIMUM_FARE
    end


    it 'method should return PENALTY_FARE when no exit_station' do
      start_journey = Journey.new(entry_station)
      expect(start_journey.fare).to eq Journey::PENALTY_FARE
    end

    it 'method should return PENALTY_FARE when no entry_station' do
        subject.finish(exit_station)
      expect(subject.fare).to eq Journey::PENALTY_FARE
    end

    describe '#finish' do
      it "method should return itself" do
        expect(subject.finish(exit_station)).to eq subject
      end
    end

    it 'method should be complete' do
      expect(subject).not_to be_complete
    end


  end


end
