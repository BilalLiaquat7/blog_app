class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @user = current_user
    @like = @post.likes.build(user: @user)

    if @like.save
      flash[:success] = 'You liked a post.'
    else
      flash.now[:error] = 'Error'
    end

    redirect_to user_posts_path(user_id: @user.id)
  end
end
