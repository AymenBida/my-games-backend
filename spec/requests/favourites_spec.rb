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
end
