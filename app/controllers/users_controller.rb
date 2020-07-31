class UsersController < ApplicationController
  def index
    result = User::Operation::Index.call(is_valid: true)

    if result.success?
      render json: { users: result[:users] }
    else
      render json: { error: { message: result[:error] } }
    end
  end

  def show
    result = User::Operation::Show.call(id: params[:id])

    if result.success?
      render json: { user: result[:user] }
    else
      render json: { error: { message: result[:error] } }
    end
  end
end
