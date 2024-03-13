class RatingsController < ApplicationController
  def show
    # @user = User.find(params[:id])
    # @ratings = @user.ratings
    # @average_rating = @ratings.sum(:stars) / @ratings.size
  end

  def new
    @rating = Rating.new
    @user_team = UserTeam.find(params[:user_team_id])
  end

  def create
    @rating = Rating.new(rating_params)
    @rating.average = calculate_average
    @rating.user_team = UserTeam.find(params[:user_team_id])

    if @rating.save
      # gérer l'enregistrement réussi
      redirect_to root_path
    else
      # gérer l'enregistrement non réussi
      render :new
    end
  end

  def save
    @rating = Rating.new(rating_params)
    @rating.user_team = current_user.user_teams.last
    if @rating.save
      redirect_to root_path(@match)
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

  def calculate_average
    ratings = [params[:rating][:team_work].to_i, params[:rating][:shoot].to_i, params[:rating][:physic].to_i, params[:rating][:dribbling].to_i]
    ratings.sum.to_f / ratings.size
  end
end
