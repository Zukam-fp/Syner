class MatchesController < ApplicationController
  before_action :set_navbar_visibility

  def index


  end

  def new
    @match = Match.new
  end

  def create
    @match = Match.new(match_params)

    room = Match::ADDRESSES.select{|address| address[:name] == @match.address}
    @match.address = room.first[:address]

    @match.user = current_user
    @match.chat_room = ChatRoom.last
    @match.number_of_places = 10
    if @match.save!
      redirect_to match_path(@match)
    else
      render :new
    end
    @team = Team.create(name: "Team A", match: @match)
    Team.create(name: "Team B", match: @match)
    UserTeam.create(user: current_user, team: @team, position: "goalkeeper")
  end

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

  private

  def match_params
    params.require(:match).permit(:address, :date)
  end
end
