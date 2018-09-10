class UsersController < ApplicationController

  def index
    if session[:current_user_id] !=nil
      @user = User.find(session[:current_user_id]).users
          render :index
    else
      redirect_to '/login'
    end
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.valid?
      user.save
      render :index
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :name, :email, :gender)
  end
end
