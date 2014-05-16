require_relative "../lib/garage"

describe Garage do
  
  let(:garage) {Garage.new}
  let(:bike) {Bike.new}
  let(:bike2) {Bike.new}
  let(:van) {Van.new}
  let(:station) {DockingStation.new}

  it "should fix broken bikes" do 
    bike.break
    bike2.break
    station.dock(bike)
    station.dock(bike2)
    van.collect_broken_bikes(station)
    van.release_broken_bikes(garage)
    expect(garage.broken_bikes.count).to eq(2)
    garage.fix_bikes
    expect(garage.broken_bikes.count).to eq(0)
  end  

end