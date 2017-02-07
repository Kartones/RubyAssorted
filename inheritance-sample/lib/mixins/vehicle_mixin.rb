module VehicleMixin
    def hasEngine?
        return @hasEngine
    end

    def startEngine
        puts "Engine started" if @hasEngine and @logger
        return @hasEngine
    end

    def stopEngine
        puts "Engine stopped" if @hasEngine and @logger
        return @hasEngine
    end

    def displaceTo(destination)
        puts " moving to %s" % [destination] if @logger
        return true
    end

    protected :displaceTo

    # private

end