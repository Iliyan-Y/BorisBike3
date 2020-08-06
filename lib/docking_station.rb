require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :bike
  attr_accessor :capacity
  def initialize(capacity=DEFAULT_CAPACITY)
    @available_bikes = []
    @capacity = capacity
  end

  def release_bike
    fail 'No bikes available' if empty?
    @available_bikes.pop
  end

  def dock(bike)
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
