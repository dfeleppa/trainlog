class CoachesController < ApplicationController
    def athletes
        self.athletes = self.athlete_id.all
    end
end
