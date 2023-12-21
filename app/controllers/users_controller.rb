class UsersController < ApplicationController
  def index
    @users = User.all
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render :index
    end
  end

  private

  def user_params
    params[:user].permit! # Permitting all parameters
  end
end
