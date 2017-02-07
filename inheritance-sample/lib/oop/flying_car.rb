require_relative "car"
require_relative "plane"

class FlyingCar < Vehicle
    def initialize(car, plane, logger=true)
        @car = car
        @plane = plane
        super(logger=logger)
    end

    def drive(destination)
        return @car.drive(destination)
    end

    def fly(destination)
        return @plane.fly(destination)
    end

end