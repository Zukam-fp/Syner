class UserTeamsController < ApplicationController
  def new
    @user_team = UserTeam.new
  end

  def create
    @user_team = UserTeam.new(user_team_params)
    @user_team.user = current_user
    if @user_team.save
      redirect_to user_team_path(@user_team)
    else
      render :new
    end
  end

  def show
    @user_team = UserTeam.find(params[:id])
  end

  def edit
    @user_team = UserTeam.find(params[:id])
    authorize! :update, @user_team
  end

  def update
    @user_team = UserTeam.find(params[:id])
    authorize! :update, @user_team
    if @user_team.update(user_team_params)
      redirect_to user_team_path(@user_team)
    else
      render :edit
    end
  end

  private

  def user_team_params
    params.require(:user_team).permit(:name, :user_position)
  end

  def set_user_team
    @user_team = UserTeam.find(params[:id])
  end
end
