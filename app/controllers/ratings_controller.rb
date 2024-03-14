class RatingsController < ApplicationController
  def show
    # @user = User.find(params[:id])
    # @ratings = @user.ratings
    # @average_rating = @ratings.sum(:stars) / @ratings.size
  end

  def new
    @rating = Rating.new


    @team = Team.find(params[:team_id])
    @user_teams =  @team.user_teams.where.not(user_id: current_user.id)
    @user_team = @user_teams.where.missing(:ratings).first
    if @user_team.nil?
      redirect_to match_path(@team.match)
    end
    p @user_team

  end

  def create
    @user_team = UserTeam.find(params[:user_team_id])
    @rating = Rating.new(rating_params)
    @rating.average = calculate_average
    @rating.user_team = @user_team

    if @rating.save
      # gérer l'enregistrement réussi
      redirect_to new_team_rating_path(@user_team.team)
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

  def team
    @rating_team = Rating.new(rating_params)
    @rating_team.average = calculate_average_team
    @rating_team.user_team = UserTeam.find(params[:user_team_id])
  end

  def shoot
    @rating_shoot = Rating.new(rating_params)
    @rating_shoot.average = calculate_average_shoot
    @rating_shoot.user_team = UserTeam.find(params[:user_team_id])
  end

  def physic
    @rating_physic = Rating.new(rating_params)
    @rating_physic.average = calculate_average_physic
    @rating_physic.user_team = UserTeam.find(params[:user_team_id])
  end

  def dribbling
    @rating_dribbling = Rating.new(rating_params)
    @rating_dribbling.average = calculate_average_dribbling
    @rating_dribbling.user_team = UserTeam.find(params[:user_team_id])
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

  def calculate_average_team
    ratings = [params[:rating][:team_work].to_i]
    ratings.sum.to_f / ratings.size
  end

  def calculate_average_shoot
    ratings = [params[:rating][:shoot].to_i]
    ratings.sum.to_f / ratings.size
  end

  def calculate_average_physic
    ratings = [params[:rating][:physic].to_i]
    ratings.sum.to_f / ratings.size
  end

  def calculate_average_dribbling
    ratings = [params[:rating][:dribbling].to_i]
    ratings.sum.to_f / ratings.size
  end
end
