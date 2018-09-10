class UsersController < ApplicationController

  def show
    if session[:current_user_id] !=nil
      @user = User.find(session[:current_user_id])
          render :index
    else
      redirect_to '/login'
    end
  end

  def new

    @user = User.new
      render :layout => false

  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:current_user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :name, :email, :gender)
  end
end
