class RatingsController < ApplicationController
  def new
    @rating = Rating.new
  end

  def create
    @rating = Rating.new(rating_params)
    @rating.user_team = current_user.user_team
    if @rating.save
      redirect_to user_team_path(current_user.user_team)
    else
      render :new
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:team_work, :physic, :dribbling, :shoot)
  end

  def set_rating
    @rating = Rating.find(params[:id])
  end
end
