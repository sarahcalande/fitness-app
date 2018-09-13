class RoutinesController < ApplicationController
  def index
    @routines = Routine.all.select{|routine| routine.user_id == session[:current_user_id]}
  end

  def new
    @routine = Routine.new
  end

  def create
    @routine = Routine.new(routine_params)
    @routine.update(user_id: session[:current_user_id])
      if @routine.save
        redirect_to @routine
      else
        render :new
      end
  end

  def show
    @routine = Routine.find(params[:id])
  end

  def edit
    @routine = Routine.find(params[:id])
  end

  def update
    @routine = Routine.find(params[:id])
    if @routine.update(routine_params)
      redirect_to @routine
    else
      render :edit
    end
  end

  def destroy
    @routine = Routine.find(params[:id]).destroy
    redirect_to routines_path
  end


private

  def routine_params
    params.require(:routine).permit(:name,:sets, :reps, :week_day, :weight, exercise_ids: [])
  end
end
