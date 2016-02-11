class ActorsController < ApplicationController
  before_action :logged_in_user
  
  def new
    @actor = Actor.new
  end
  
  def create
    @actor = Actor.new(actor_params)
    if @actor.save
      flash[:success] = "Actor created!"
      redirect_to @actor
    else
      render 'new'
    end
  end
  
  def show
    @actor = Actor.find(params[:id])
  end
  
  private

    def actor_params
      params.require(:actor).permit(:title, :description, :picture, :eye_right_x, :eye_right_y, :eye_left_x, :eye_left_y)
    end  
end
