class MusclesController < ApplicationController

  def index
    @muscles = Muscle.all
  end

  def show
    @muscle = Muscle.find(params[:id])
  end


end
