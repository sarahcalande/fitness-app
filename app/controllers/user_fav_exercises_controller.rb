class UserFavExercisesController < ApplicationController

  def save_to_favs
    UserFavExercise.create(exercise_id: session[:current_exercise_id], user_id: session[:current_user_id])
    redirect_to exercise_path(session[:current_exercise_id])

  end

  def remove_from_favs
    user_fav_exercise = UserFavExercise.find_by(exercise_id: session[:current_exercise_id], user_id: session[:current_user_id])
    user_fav_exercise.destroy
    redirect_to exercise_path(session[:current_exercise_id])

  end


end
