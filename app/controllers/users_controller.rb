class UsersController < ApplicationController
  # new
  def new
    @user = User.new
  end

  # create
  def create
    # render plain: params[:user].inspect

    @user = User.new(user_params_new)
    if @user.save
      redirect_to @user
    else
      ## render plain: format("Error save -> %s \n\n %s",
      ##                    @user.errors.inspect,
      ##                    params[:user].inspect)
      render "new"
    end


  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params_update)
      redirect_to @user
    else
      render "edit"
    end
  end


  def show
    # render plain: params[:id].inspect
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path
  end

  def find
    @user = User.new
    if params[:username]
      @user = User.find_by(name: params[:username])
    end
    redirect_to @user
  end

  private
  def user_params_new
    params.require(:user).permit(:username, :password, :email)
  end

  private
  def user_params_update
    params.require(:user).permit(:id, :username, :password, :email)
  end
end
