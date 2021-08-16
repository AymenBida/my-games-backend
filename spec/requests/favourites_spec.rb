require 'rails_helper'

RSpec.describe 'Favourites API', type: :request do
  let(:games) { create_list(:game, 10) }
  let(:game_id) { games.first.id }
  let(:user) { create(:user) }
  let(:headers) { valid_headers }
  let(:valid_attributes) { { game_id: game_id }.to_json }
  let(:invalid_attributes) { { game_id: '99' }.to_json }

  describe 'POST /favourites' do
    context 'when the request is valid' do
      before { post '/favourites', params: valid_attributes, headers: headers }

      it 'adds a game to favourites' do
        expect(response).to have_http_status(201)
      end

      it 'returns a success message' do
        expect(json['message']).to match(/Game successfully added to favourites/)
      end
    end

    context 'when the request is not valid (non existing game)' do
      before { post '/favourites', params: invalid_attributes, headers: headers }

      it 'does not add the game' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/Validation failed: Game must exist/)
      end
    end
  end

  describe 'GET /favourites' do
    context 'when user is logged in' do
      context 'when user have favourites' do
        let!(:favourite) { Favourite.create(user_id: user.id, game_id: game_id) }
        before { get '/favourites', headers: headers }

        it 'returns the user favourites array' do
          expect(json.size).to eq(1)
        end

        it 'returns status code 200' do
          expect(response).to have_http_status(200)
        end
      end

      context 'when user does not have favourites' do
        before { get '/favourites', headers: headers }

        it 'returns a message saying no favourites' do
          expect(json['message']).to match(/No favourite games found/)
        end

        it 'returns status code 200' do
          expect(response).to have_http_status(200)
        end
      end
    end
  end

  describe 'DELETE /favourites/:id' do
    let!(:favourite) { Favourite.create(user_id: user.id, game_id: game_id) }
    before { delete "/favourites/#{game_id}", headers: headers }

    context 'when the record exists' do
      it 'returns code status 204' do
        expect(response).to have_http_status(204)
      end
    end

    context 'when the record does not exist' do
      let(:game_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Favourite/)
      end
    end
  end
end
