require "./lib/oop/vehicle"
require "./lib/oop/car"
require "./lib/oop/plane"
require "./lib/oop/flying_car"

RSpec.describe Vehicle do
#before(:all) do
#end
#before(:each) do
#end
#after(:all) do
#end
#after(:each) do
#end
context "Engine" do
    it "Properly sets if a vehicle with engine" do
        vehicleWithEngine = Vehicle.new(hasEngine=true, logger=false)
        expect(vehicleWithEngine.hasEngine?).to eq(true)
        expect(vehicleWithEngine.startEngine).to eq(true)
        expect(vehicleWithEngine.stopEngine).to eq(true)
    end

    it "Properly sets if a vehicle without engine" do
        vehicleWithoutEngine = Vehicle.new(hasEngine=false, logger=false)
        expect(vehicleWithoutEngine.hasEngine?).to eq(false)
        expect(vehicleWithoutEngine.startEngine).to eq(false)
        expect(vehicleWithoutEngine.stopEngine).to eq(false)
    end
end
end

RSpec.describe Car do
context "Parent call" do
    it "Always has an engine" do
        car = Car.new(logger=false)
        expect(car.hasEngine?).to eq(true)
        expect(car.startEngine).to eq(true)
        expect(car.stopEngine).to eq(true)
    end

    it "When driving calls displaceTo from parent" do
        expect(Car.new(logger=false).drive("home")).to eq(true)
    end
end
end

RSpec.describe Plane do
context "Parent call" do
    it "Always has an engine" do
        plane = Plane.new(logger=false)
        expect(plane.hasEngine?).to eq(true)
        expect(plane.startEngine).to eq(true)
        expect(plane.stopEngine).to eq(true)
    end

    it "When flying calls displaceTo from parent" do
        expect(Plane.new(logger=false).fly("home")).to eq(true)
    end
end
end

RSpec.describe FlyingCar do
context "Driving & Flying" do
    it "Can be driven like a car" do
        logger = false
        expect(FlyingCar.new(Car.new(logger=logger), Plane.new(logger=logger), logger=logger)
                        .drive("home")
              ).to eq(true)
    end

    it "Can fly like a plane" do
        logger = false
        expect(FlyingCar.new(Car.new(logger=logger), Plane.new(logger=logger), logger=logger)
                        .fly("home")
              ).to eq(true)
    end
end
end