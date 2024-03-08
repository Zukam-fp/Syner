class UserTeamsController < ApplicationController
  def new
    @match = Match.find(params[:match_id])
    @user_team = UserTeam.new
  end

  def create
    @match = Match.find(params[:match_id])
    @user_team = UserTeam.new(user_team_params)
    @user_team.user = current_user
    # @match = @user_team.match
    if @user_team.save
      redirect_to new_match_user_team_path(@match)
    else
      @match = Match.find(params[:match_id])
      render :new
    end
  end

  private

  def user_team_params
    params.require(:user_team).permit(:user_position, :team_id)
  end
end
