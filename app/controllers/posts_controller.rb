class PostsController < ApplicationController
  before_action :set_user
  before_action :set_post, only: [:show]

  def index
    @posts = @user.posts
  end

  def show
    # The @post is already set by the `set_post` method
  end

  private

  def set_user
    @user ||= User.includes(:posts).find(params[:user_id])
  end

  def set_post
    @post ||= @user.posts.find(params[:id])
  end
end
