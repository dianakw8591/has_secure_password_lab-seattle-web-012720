class SessionsController < ApplicationController
    def create
        @user = User.find_by(name: params[:user][:name])
        authenticated = @user.try(:authenticate, params[:user][:password])
        if authenticated
            session[:user_id] = @user.id
            redirect_to users_path
        else
            redirect_to login_path
        end    
    end
end