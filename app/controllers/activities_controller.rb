class ActivitiesController < ApplicationController
    def destroy 
        activity = Activity.find_by_id(params[:id])
        if activity 
            activity.destroy 
        else 
            render json: {
                "error": "Activity not found"
              }
         end 
        end 
end
