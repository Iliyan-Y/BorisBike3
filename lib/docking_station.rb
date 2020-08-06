require_relative 'bike'

class DockingStation
  attr_reader :bike
  def initialize
    @available_bikes = []
  end
  
  def release_bike
    fail 'No bikes available' unless @available_bikes.count >=1
    @available_bikes[0]
  end

  def dock(bike)
    fail "No space available" if @available_bikes.count >= 20
    @available_bikes.append(bike)
  end
end
