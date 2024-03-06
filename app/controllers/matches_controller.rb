class MatchesController < ApplicationController
  def new
    @match = Match.new
  end

  def create
    @match = Match.new(match_params)
    @match.user = current_user
    if @match.save
      redirect_to match_path(@match)
    else
      render :new
    end
  end

  def show
    @match = Match.find(params[:id])
  end

  def edit
    @match = Match.find(params[:id])
    authorize! :update, @match
  end

  def update
    @match = Match.find(params[:id])
    authorize! :update, @match
    if @match.update(match_params)
      redirect_to match_path(@match)
    else
      render :edit
    end
  end

  def destroy
    @match = Match.find(params[:id])
    authorize! :destroy, @match
    @match.destroy
    redirect_to matches_path
  end

  private

  def match_params
    params.require(:match).permit(:number_of_places, :address, :date)
  end

  def set_match
    @match = Match.find(params[:id])
  end
end
