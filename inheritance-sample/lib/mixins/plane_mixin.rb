module PlaneMixin
    def fly(destination)
        puts "Flying" if @logger
        displaceTo(destination)
    end
end