class SessionsController < ApplicationController

  def new
    render :layout => false
  end


  def create
    @user = User.find_by(username:params['username'])
    if @user && @user.authenticate(params['password'])
      session[:current_user_id] = @user.id
      redirect_to @user
    else
      redirect_to '/login'
    end
  end

  def destroy
    session.delete :current_user_id
    redirect_to '/login'
  end

end
