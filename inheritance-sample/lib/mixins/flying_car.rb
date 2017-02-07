require_relative "car_mixin"
require_relative "plane_mixin"

class FlyingCar < Vehicle
    include CarMixin
    include PlaneMixin

    def initialize(logger=true)
        super(hasEngine=true, logger=logger)
    end
end