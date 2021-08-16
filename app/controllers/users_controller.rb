class UsersController < ApplicationController
  skip_before_action :authorize_request, only: :create

  def create
    user = User.create!(user_params)
    auth = AuthenticateUser.new(user.email, user.password).call
    auth_token = auth[:auth_token]
    response = { message: Message.account_created, auth_token: auth_token, username: user.name }
    json_response(response, :created)
  end

  private

  def user_params
    params.permit(:name, :email, :password)
  end
end
