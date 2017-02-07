require_relative "vehicle"
require_relative "car_mixin"

class Car < Vehicle
    include CarMixin

    def initialize(logger=true)
        super(hasEngine=true, logger=logger)
    end
end