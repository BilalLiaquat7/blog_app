class UsersController < ApplicationController
  before_action :set_users, only: [:index]
  before_action :set_user, only: [:show]

  def index
    # @users is already set by the `set_users` method
  end

  def show
    # @user is already set by the `set_user` method
  end

  private

  def set_users
    @set_users ||= User.includes(:posts).all
  end

  def set_user
    @set_user ||= User.includes(:posts).find(params[:id])
  end
end
