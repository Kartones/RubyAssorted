require_relative "vehicle"
require_relative "plane_mixin"

class Plane < Vehicle
    include PlaneMixin

    def initialize(logger=true)
        super(hasEngine=true, logger=logger)
    end
end