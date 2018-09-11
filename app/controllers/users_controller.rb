class UsersController < ApplicationController

  def show
    if session[:current_user_id] !=nil
      @user = User.find(session[:current_user_id])
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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(exercise_params)
      redirect_to @user
    else
      render :edit
    end
  end

def destroy
  @user = User.find(params[:id])
  redirect_to users_path
end



  private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :name, :email, :gender)
  end
end
