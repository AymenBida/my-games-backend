class GamesController < ApplicationController
  def index
    @games = Game.all
    json_response(@games)
  end

  def show
    @game = Game.find(params[:id])
    json_response(@game)
  end

  def create
    @game = Game.create!(game_params)
    json_response(@game, :created)
  end

  private

  def game_params
    params.permit(:title, :year, :cover)
  end
end
