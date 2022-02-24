class SessionsController < ApplicationController
    skip_before_action :authorize, only: [:create]

    def create
        u = User.find_by(username: params[:username])
        if u&.authenticate(params[:password])
            session[:user_id] = u.id
            render json: u
        else
            render json: { errors: ["Username or Password Invalid"] }, status: 401
        end
    end

    def destroy
        session.delete :user_id
        head 204
    end
end
