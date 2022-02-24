class RecipesController < ApplicationController

    def index
        render json: Recipe.all
    end

    def create
        r = User.find_by(id: session[:user_id]).recipes.create!(r_params)
        render json: r, status: 201
    end

    private
    
    def r_params
        params.permit(:title, :instructions, :minutes_to_complete)
    end
end
