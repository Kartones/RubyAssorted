require_relative "vehicle"

class Plane < Vehicle

    def initialize(logger=true)
        super(hasEngine=true, logger=logger)
    end

    def fly(destination)
        puts "Flying" if @logger
        displaceTo(destination)
    end

end
