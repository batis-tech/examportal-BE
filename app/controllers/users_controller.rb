class UsersController < ApplicationController
    before_action :set_profile, only: %i[ profile  destroy]
    before_action :set_account, only: %i[ update]

    def show
      @users = User.all
      render json: @users
    end

    def profile
     render json: @profile
    end


    def update
     @profile.update(user_params)

    end

    def destroy
      @profile.destroy
    end

    private

    def set_profile
      @profile = User.find(params[:id])
    end
    def set_account
      @account = User.find(params[:email])
    end
    def user_params
      devise_parameter_sanitizer.permit(:account_update, keys: [:userType,:name])
    end

end
