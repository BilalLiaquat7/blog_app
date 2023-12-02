class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @user = current_user
    @like = Like.new(user: @user, post: @post)

    if @like.save
      flash[:success] = 'You liked the post.'
    else
      flash.now[:error] = 'Error'
    end

    redirect_to user_posts_path(@post.author.id, @post.id)
  end
end
