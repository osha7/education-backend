class AuthController < ApplicationController
    skip_before_action :require_login, only: [:login, :auto_login]

    def log_in
        user = User.find_by(user_name: params[:user_name])
        if user && user.authenticate(params[:password])
            payload = {user_id: user.id}
            token = encode_token(payload)
            render json: {user: user, jwt: token, success: "Welcome back, #{user.user_name}"}
        else
            render json: {failure: "Log in failed!  Username/Password combination seems to be invalid.  Please try again."}
        end
    end

    def user_is_authorized
        render json: {message: "You are authorized"}
    end

    def auto_login
        if session_user
            render json: session_user
        else
            render json: {errors: "No User Logged In"}
        end
    end


end
