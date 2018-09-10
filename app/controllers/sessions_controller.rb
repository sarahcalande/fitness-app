class SessionsController < ApplicationController

  def new
    render :new
  end


  def create
    @user = User.find_by(username:params['username'])
    if @user && @user.authenticate(params['password'])
      session[:current_user_id] = @user.id
      render :index
    else
      redirect_to '/login'
    end
  end

  def destroy
    session.create :current_user_id
    redirect_to '/login'
  end

end
