class PostsController < ApplicationController
  before_action :set_user
  before_action :set_post, only: [:show]

  def index
    @posts = @user.posts
  end

  def show
    # The @post is already set by the `set_post` method
  end

  def new
    @post = current_user.posts.build
  end
  
  def create
    @post = current_user.posts.build(post_params)
  
    if @post.save
      redirect_to user_posts_path(current_user)
    else
      render :new
    end
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title, :text)
  end

  def set_user
    @set_user ||= User.includes(:posts).find(params[:user_id])
  end

  def set_post
    @set_post ||= @user.posts.find(params[:id])
  end
end
