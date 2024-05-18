class Api::V1::SessionsController < ApplicationController

     def create
        user = User.find_by(email: params[:email])
        if user && user.valid_password?(params[:password])
          sign_in user
          render json: { user: UserSerializer.new(user) }, status: :ok
        else
          render json: { error: 'Invalid email or password' }, status: :unauthorized
        end
    end

    def destroy
        sign_out current_user
        render json: { message: 'Logged out successfully' }, status: :ok
      end
    end
  end
end

