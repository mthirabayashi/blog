class UsersController < ApplicationController
  def index
    @users = User.all
    render plain: @users.last.to_json
  end
end
