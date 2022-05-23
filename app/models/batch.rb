require "ice_cube"
require "active_support/time"
# serialize :schedule, Hash

class Batch < ApplicationRecord
    serialize :schedule, Hash

    def create_schedule
        schedule = IceCube::Schedule.new(self.start_datetime, duration: duration(start_datetime, end_datetime))
        schedule.add_recurrence_rule(IceCube::Rule.daily)
        self.schedule = schedule.to_hash
    end

    def duration(start_time, end_time)
        end_time.to_i - start_time.to_i
    end
end
