require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :bike
  def initialize
    @available_bikes = []
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
    if @available_bikes.count >= DEFAULT_CAPACITY
       true
    end
  end

  def empty?
    if @available_bikes.empty?
      true
    end
  end

end
