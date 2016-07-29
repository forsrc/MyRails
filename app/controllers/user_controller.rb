class UserController < ApplicationController

    # new
    def new

    end

    # create
    def create
        # render plain: params[:user].inspect

        @user = User.new(user_params_new)
        @user.save
        redirect_to @user

    end


    def show
        # render plain: params[:id].inspect
        @user = User.find(params[:id])
    end

    def index
        @users = User.all
    end


    private
      def user_params_new
        params.require(:user).permit(:username, :password, :email)
      end

end
