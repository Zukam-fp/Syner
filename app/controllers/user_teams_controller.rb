class UserTeamsController < ApplicationController

  def new
    @match = Match.find(params[:match_id])
    @user_team = UserTeam.new
  end

  def create
    @match = Match.find(params[:match_id])
    @user_team = UserTeam.new(user_team_params)
    @user_team.user = current_user
    @user_team.user_position = 0
    # @match = @user_team.match
    if @user_team.save
      # redirect_to new_match_user_team_path(@match)
      redirect_to match_path(@match)
    else
      # A changer
      @match = Match.find(params[:match_id])
      render :new
    end
  end

  private

  def user_team_params
    params.require(:user_team).permit(:position, :team_id)
  end
end
