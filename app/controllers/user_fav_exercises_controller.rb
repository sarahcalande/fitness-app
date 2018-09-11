class UserFavExercisesController < ApplicationController
  def index
    @user_fav_exercises = UserFavExercise.all
  end
  #
  def new
      @user_fav_exercise = UserFavExercise.new
  end
  #
    def create
      @user_fav_exercise = UserFavExercise.new(user_fav_exercise_params)
        if @user_fav_exercise.valid?
          @user_fav_exercise.save
          redirect_to @user_fav_exercise
        else
          render :new
        end
      end

  #   def destroy
  #
      def user_fav_exercise_params
        params.require(:user_fav_exercises).permit(:user_id, :exercise_id)
      end
  #
end
