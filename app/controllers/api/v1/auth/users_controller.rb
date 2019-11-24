class Api::V1::Auth::UsersController< ApplicationController
  def login
    @user = User.find_by(username: login_params[:username])

    if @user&.authenticate(login_params[:password])
      token = JwtService.encode(user_id: @user.id)
      time  = Time.now + 24.hours.to_i

      render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                     username: @user.username }, status: :ok
    else
      raise(ExceptionHandler::AuthenticationError, invalid_credentials)
    end
  end

  def signup
    @user = User.new(login_params)

    begin
      if @user.save
        token = JwtService.encode(user_id: @user.id)
        time  = Time.now + 24.hours.to_i

        render json: { token: token, username: @user.username }, status: :created
      else
        raise(ActiveRecord::RecordInvalid, @user)
      end
    end
  end

  private

  def login_params
    params.permit(:username, :password)
  end
end
