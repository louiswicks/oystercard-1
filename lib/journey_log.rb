class JourneyLog
    attr_reader :journey_class
    def initialize(journey_class: Journey)
        @journey_class = journey_class
        @journeys = []
    end

  def start_journey(station)
    add(journey_class.new(entry_station: station))
  end

  def add(journey)
    @journeys << journey
  end

  def journeys
    @journeys.dup
  end

end
