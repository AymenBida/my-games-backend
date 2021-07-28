class GamesController < ApplicationController
  def index
    @games = Game.all
    json_response(@games)
  end

  def show
    @game = Game.find(params[:id])
    json_response(@game)
  end
end
