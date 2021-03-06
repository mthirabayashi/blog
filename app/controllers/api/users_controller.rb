class Api::UsersController < ApplicationController
  def index
    @users = User.all
    # render 'api/users/index.json.jbuilder'
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save

    else
      render json: {signUp: @user.errors.full_messages}, status: 422
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)

    else
      render json: @user.errors.full_messages, status: 422
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy

    else
      render json: @user.errors.full_messages, status: 422
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
