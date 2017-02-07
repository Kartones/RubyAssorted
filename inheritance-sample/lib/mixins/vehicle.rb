require_relative "vehicle_mixin"

class Vehicle
    include VehicleMixin

    def initialize(hasEngine, logger=true)
        @hasEngine = hasEngine
        @logger = logger
    end
end