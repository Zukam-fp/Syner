class MatchesController < ApplicationController
  def show
    @match = Match.find(params[:id])
    sort_by_places
  end

  def sort_by_places
    @match_sort = Match.all.sort_by{ |m| m.number_of_places >= 9 }.first
  end
end
