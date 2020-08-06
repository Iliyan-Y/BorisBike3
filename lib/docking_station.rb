require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20
  attr_accessor :capacity
  def initialize(capacity=DEFAULT_CAPACITY)
    @available_bikes = []
    @capacity = capacity
  end

  def release_bike
    fail 'No bikes available' if empty?
    @available_bikes.each do |bike|
      if bike.working?
        @available_bikes.delete(bike)
        return bike
      end
    end
    fail 'Available bikes are broken'  
  end

  def dock(bike, status = bike.working)
    bike.report(status)
    fail "No space available" if full?
    @available_bikes.append(bike)
  end

  private 
  
  def full? 
    if @available_bikes.count >= @capacity
       true
    end
  end

  def empty?
    if @available_bikes.empty?
      true
    end
  end

end
