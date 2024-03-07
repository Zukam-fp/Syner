class VotesController < ApplicationController
  def vote
  end

  def create
    @vote = Vote.new(vote_params)
    @vote.user = current_user
    if @vote.save
      redirect_to vote_path(@vote)
    else
      render :new
    end
  end
end
