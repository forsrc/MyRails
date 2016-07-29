class UserController < ApplicationController

    # new
    def new

    end

    # create
    def create
        # render plain: params[:user].inspect

        @user = User.new(user_params_new)
        if @user.save
            redirect_to @user
        else
            render plain: format("Error save -> %s \n\n %s",
                                 @user.errors.full_messages.inspect,
                                 params[:user].inspect)
        end


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
