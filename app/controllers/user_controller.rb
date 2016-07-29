class UserController < ApplicationController

    # new
    def new

    end

    # create
    def create
        render plain: params[:user].inspect
    end

end
