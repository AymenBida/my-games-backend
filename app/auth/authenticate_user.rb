class AuthenticateUser
  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    { auth_token: JsonWebToken.encode(user_id: user.id), username: user.name } if user
  end

  private

  attr_reader :email, :password

  def user
    user = User.find_by(email: email)
    return user if user&.authenticate(password)

    raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
  end
end
