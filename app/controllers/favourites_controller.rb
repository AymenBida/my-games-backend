class FavouritesController < ApplicationController
  def create
    Favourite.create!(user_id: current_user.id, game_id: fav_params[:game_id])
    response = { message: Message.favourite_created }
    json_response(response, :created)
  end

  def index
    favourites = current_user.favourites.all
    return json_response(favourites) unless favourites.empty?

    response = { message: Message.no_favourites }
    json_response(response)
  end

  def destroy
    favourite = Favourite.where('user_id = ? AND game_id = ?', current_user.id, fav_params[:id]).first
    unless favourite
      response = { message: Message.favourite_not_found }
      json_response(response, :not_found)
      return
    end
    favourite.destroy
  end

  private

  def fav_params
    params.permit(:game_id, :id)
  end
end
