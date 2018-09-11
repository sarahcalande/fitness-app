class ExercisesController < ApplicationController

  def index
    @exercises = Exercise.all
  end

  def show
    @exercise = Exercise.find(params[:id])
  end

  def new
      @exercise = Exercise.new
  end

  def create
    @exercise = Exercise.new(exercise_params)
      if @exercise.valid?
        @exercise.save
        redirect_to @exercise
      else
        render :new
      end
  end



  private
  def exercise_params
    params.require(:exercise).permit(:name, :description, :instructions, muscle_id: [])
  end










end
