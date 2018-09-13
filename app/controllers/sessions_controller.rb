class SessionsController < ApplicationController

  def new
    @user = User.new
    if logged_in? && User.find(session[:current_user_id]).blank?
      session.delete :current_user_id
    elsif logged_in?
      redirect_to user_path(session[:current_user_id])
    end
  end


  def create
    @user = User.find_by(name: session_params[:username])
    if @user && @user.authenticate(session_params[:password])
      session[:current_user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:notice] = "Invalid username/password combination"
      render :new
    end
  end

  def destroy
    session.delete :current_user_id
    redirect_to '/login'
  end


private

def session_params
  params.require(:session).permit(:username, :password)
end



end
