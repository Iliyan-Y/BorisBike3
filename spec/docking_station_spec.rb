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
end
