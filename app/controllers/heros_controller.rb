class HerosController < ApplicationController
  before_action :logged_in_user
  
  def new
    @hero = Hero.new
  end

  def create
    @hero = Hero.new(hero_params)
    
    @hero.eye_right_x = @hero.eye_right_y = @hero.eye_left_x = @hero.eye_left_y = 0 if @hero.eye_right_x.nil?
    if @hero.save
      flash[:success] = "Hero created!"
      redirect_to @hero
    else
      render 'new'
    end
  end
  
  def show
    @hero = Hero.find(params[:id])
  end
  
  private

    def hero_params
      params.require(:hero).permit(:title, :description, :picture, :eye_right_x, :eye_right_y, :eye_left_x, :eye_left_y)
    end  
end
