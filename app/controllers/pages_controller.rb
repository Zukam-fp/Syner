class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @match_sort = Match.all.sort_by{ |m| m.number_of_places >= 9 }.first
    @match_sort2 = Match.all.sort_by{ |m| m.number_of_places >= 9 }.second
    @match_sort3 = Match.all.sort_by{ |m| m.number_of_places >= 9 }.third
    @user1 = User.all.first
    @user2 = User.all.second
    @user3 = User.all.third
  end
end
