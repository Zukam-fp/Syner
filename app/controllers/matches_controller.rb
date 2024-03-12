class MatchesController < ApplicationController
  before_action :set_navbar_visibility
  def show
    @match = Match.find(params[:id])
    @user_team = UserTeam.joins(:team).where(teams: { match_id: @match.id }, user_id: current_user.id).first || UserTeam.new

    sort_by_places
  end

  def sort_by_places
    @match_sort = Match.all.sort_by{ |m| m.number_of_places >= 9 }.first
  end



  def set_navbar_visibility
    @show_navbar = action_name != 'show'
  end
end
