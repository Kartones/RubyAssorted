module CarMixin
    def drive(destination)
        puts "Driving" if @logger
        displaceTo(destination)
    end
end