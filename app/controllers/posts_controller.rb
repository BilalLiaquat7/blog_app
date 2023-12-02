class PostsController < ApplicationController
  before_action :set_user
  before_action :set_post, only: [:show]

  def index
    @posts = @user.posts.includes(:comments)
  end

  def show
    # The @post is already set by the `set_post` method
  end

  private

  def set_user
    @set_user ||= User.includes(:posts).find(params[:user_id])
  end

  def set_post
    @set_post ||= @user.posts.find(params[:id])
  end

  def create
    @user = User.find(params[:user_id])
    @post = Post.new(author_id: @user.id, title: params[:post][:title], text: params[:post][:text])
    if @post.save
      redirect_to user_posts_path(@post.author.id)
    else
      render :new
    end
  end
end
