class UsersController < ApplicationController

  def show
    if session[:current_user_id] !=nil
      @user = User.find(session[:current_user_id])
      @categories = Category.all
    else
      redirect_to '/login'
    end
  end

  def new
    @user = User.new
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
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

def destroy
  @user = User.find(params[:id]).destroy
    session.delete :current_user_id
  redirect_to '/login'
end



  private
  def user_params
    params.require(:user).permit(:username, :name, :email, :gender, :password, :password_confirmation)
  end
end
