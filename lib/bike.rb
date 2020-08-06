class Bike
  def initialize(status = 'working')
    @working = status
  end
  def working?
    if @working == 'working'
      true
    elsif @working == 'broken'
      false
    end
  end
  def report(status)
    @working = status
  end
end
