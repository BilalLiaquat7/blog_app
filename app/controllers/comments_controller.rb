class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end

  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = Comment.new(user_id: @user.id, post_id: @post.id, text: params[:comment][:text])
    if @comment.save
      redirect_to user_post_comments_path(@post.author.id, @post.id)
    else
      render 'new'
    end
  end
end
