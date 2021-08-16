require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  let(:user) { create(:user) }
  let(:valid_attributes) do
    {
      name: 'Aymen',
      email: 'aymen@bida.com',
      password: '123456'
    }
  end
  let(:invalid_attributes) do
    {
      name: nil,
      email: 'bla@bla.com',
      password: '123'
    }
  end
  let(:existing_user_attributes) do
    {
      name: 'anything',
      email: 'username@domain.com',
      password: '1234'
    }
  end

  describe 'POST /users' do
    context 'when attributes are valid' do
      before { post '/users', params: valid_attributes }

      it 'creates a user' do
        expect(response).to have_http_status(201)
      end

      it 'returns a success message' do
        expect(json['message']).to match(/Account created successfully/)
      end

      it 'returns an authentication token' do
        expect(json['auth_token']).not_to be_nil
      end
    end

    context 'when attributes are not valid' do
      before { post '/users', params: invalid_attributes }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/Validation failed: Name can't be blank/)
      end
    end

    context 'when user already exists' do
      before do
        user
        post '/users', params: existing_user_attributes
      end

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/Validation failed: Email has already been taken/)
      end
    end
  end
end
