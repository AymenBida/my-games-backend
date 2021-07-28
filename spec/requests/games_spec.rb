require 'rails_helper'

RSpec.describe 'Games API', type: :request do
  let!(:games) { create_list(:game, 10) }
  let(:game_id) { games.first.id }

  describe 'GET /games' do
    before { get '/games' }

    it 'returns games' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /games/:id' do
    before { get "/games/#{game_id}" }

    context 'when the record exists' do
      it 'returns the game' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(game_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:game_id) { 99 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(reponse.body).to match(/Couldn't find Game/)
      end
    end
  end
end
