class FavouritesController < ApplicationController
  def create
    Favourite.create!(user_id: current_user.id, game_id: fav_params[:game_id])
    response = { message: Message.favourite_created }
    json_response(response, :created)
  end

  private

  def fav_params
    params.permit(:game_id)
  end
end
