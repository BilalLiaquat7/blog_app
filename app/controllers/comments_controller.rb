class CommentsController < ApplicationController
  before_action :find_post, only: [:new, :create]

  def new
    @comment = @post.comments.build
  end

  def create
    @comment = @post.comments.build(comment_params.merge(user: current_user))

    if @comment.save
      redirect_to user_posts_path(current_user, @post)
    else
      render :new
    end
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
