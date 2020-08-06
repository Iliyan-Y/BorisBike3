require 'docking_station.rb'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it "releases working bikes" do
    bike = Bike.new
    subject.dock(bike)
    subject.release_bike
    expect(bike).to be_working
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  it 'gives an error when you try to release a bike if none are available' do
    expect { subject.release_bike }.to raise_error 'No bikes available'
  end

  it "raises an error when full and you try to dock a bike" do 
    DockingStation::DEFAULT_CAPACITY.times do
      subject.dock Bike.new
    end
    expect { subject.dock Bike.new }.to raise_error "No space available" 
  end

  it "creates a docking station with capacity default capacity" do 
    station = DockingStation.new
    expect(station.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it "Docking station with variable capacity" do 
    station = DockingStation.new(30)
    30.times { station.dock Bike.new }
    expect {station.dock Bike.new }.to raise_error "No space available"
  end


end
