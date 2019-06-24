class Api::V1::UsersController < ApplicationController
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to current_user
        else
            render new_user_path
        end
    end

    def requests
        @user = current_user 
        @requests = valid_requests
    end

    private

    def valid_requests
        Request.all.select{|request|request.user_id != current_user.id}
    end

    def character_requests
        current_user.requests.collect {|r| Character.find(r.character_id)}
    end

    def user_params
        params.require(:user).permit(:email, :password)
    end
end
