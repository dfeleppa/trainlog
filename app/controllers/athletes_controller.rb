class AthletesController < ApplicationController
    def index
        @athletes = current_user.athletes
      end
    
      def show
        @athlete = Athlete.find_by(id: params[:id])
      end
    
    
      def new
        @athlete = Athlete.new
      end
    
      def create
        @athlete = current_user.athletes.build(athlete_params)
        if @athlete.save
          redirect_to athlete_path(@athlete)
        else
          render :new
        end
      end
    
      def edit
        @athlete = Athlete.find_by(id: params[:id])
      end
    
      def update
        @athlete = Athlete.find_by(id: params[:id])
        if @athlete.update(athlete_params)
          redirect_to athlete_path(@athlete)
        else
          render :edit
        end
      end
    
      private
    
      def race_params
        params.require(:athlete).permit(:first_name, :last_name)
      end 
end
