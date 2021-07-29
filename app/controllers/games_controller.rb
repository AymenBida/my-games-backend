class GamesController < ApplicationController
  before_action :find_game, only: %i[show update destroy]

  skip_before_action :authorize_request, only: %i[index show]

  def index
    @games = Game.all
    json_response(@games)
  end

  def show
    json_response(@game)
  end

  def create
    @game = Game.create!(game_params)
    json_response(@game, :created)
  end

  def update
    @game.update(game_params)
    head :no_content
  end

  def destroy
    @game.destroy
    head :no_content
  end

  private

  def find_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.permit(:title, :year, :cover)
  end
end
