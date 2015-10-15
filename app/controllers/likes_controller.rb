class LikesController < ApplicationController
  def create
    @post = Post.find(params[:id])
    @like = current_user.likes.build(likes_params)
    if @like.save
      flash[:notice] = "You like the post #{@post.title}."
    else
      flash[:error] = "There was an error liking the post #{@post.title}."
    end

    respond_to do |format|
      format.html
      format.js
    end
  end
  def destroy
    @post = Post.find(params[:id])
    @like = @post.likes.find(params[:id])
    if @like.destroy
      flash[:notice] = "You have unliked the #{@post.title} post"

    else
      flash[:error] = "There was an error unliking the post #{@post.title}"

    end
    respond_to do |format|
      format.html
      format.js
    end
  end
  private
  def likes_params
    params.require(:like).permit(:post_id, :user_id)
  end
end
