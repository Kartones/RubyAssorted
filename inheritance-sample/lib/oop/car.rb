require_relative "vehicle"

class Car < Vehicle

    def initialize(logger=true)
        super(hasEngine=true, logger=logger)
    end

    def drive(destination)
        puts "Driving" if @logger
        displaceTo(destination)
    end

end
