class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @match_sort = Match.all.sort_by{ |m| m.number_of_places >= 9 }.first
    @match_sort2 = Match.all.sort_by{ |m| m.number_of_places >= 9 }.second
    @match_sort3 = Match.all.sort_by{ |m| m.number_of_places >= 9 }.third
    @user1 = User.all.first
    @user2 = User.all.second
    @user3 = User.all.third
    @matches = Match.all
    @markers = @matches.geocoded.map do |match|
      {
        lat: match.latitude,
        lng: match.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {match: match})
      }
    end
  end

  def map
    if params[:query].present?
      @matches = Match.near(params[:query], 10)
    else
    @matches = Match.all
    end
    @markers = @matches.geocoded.map do |match|
      {
        lat: match.latitude,
        lng: match.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {match: match})
      }
    end
  end
end
