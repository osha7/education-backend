class Api::V1::UsersController < ApplicationController
    skip_before_action :require_login

    def index 
        users = User.all
    end

    def create
        # byebug
        user = User.create(user_params)
        
        if user.valid?
            payload = {user_id: user.id}
            token = encode_token(payload)
            render json: {user: user, jwt: token}
        else
            render json: {errors: user.errors.full_messages}, status: :not_acceptable
        end
    end

    private

    def user_params
        params.permit(:first_name, :last_name, :user_name, :email, :password, :password_digest, :admin)
    end

end
