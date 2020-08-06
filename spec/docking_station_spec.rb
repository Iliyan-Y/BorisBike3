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

  it "gives an error when there's a bike and you try to dock a new one" do 
    subject.dock(Bike.new)
    expect { subject.dock(Bike.new) }.to raise_error "No space available" 
  end

end
