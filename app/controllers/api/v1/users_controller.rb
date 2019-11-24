class Api::V1::UsersController < ApplicationController
  before_action :authorize_request, except: :create
  before_action :find_user,  only:   %i[show update]
  before_action :admin_only, except: %i[show create]

  def index
    @users = User.all
    render json: @users, status: :ok
  end

  def show
    render json: @user, status: :ok
  end

  def update
    unless @user.update(user_params)
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
  end

  private

  def find_user
    begin
      @user = User.find(params[:id])
    end
  end

  def admin_only
    return true if @current_user.admin?

    raise(
      ExceptionHandler::AuthenticationError,
      ("#{not_an_admin}")
    )
  end

  def user_params
    params.permit(
      :name,
      :username,
      :email,
      :password,
      :role,
      :password_confirmation
    )
  end
end
