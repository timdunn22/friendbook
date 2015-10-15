class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
   @comments = @post.comments
   @comment = current_user.comments.build( comment_params )
   @comment.post = @post
  

   if @comment.save
     flash[:notice] = "Comment was created."
   else
     flash[:error] = "There was an error saving the comment. Please try again."
   end

   respond_to do |format|
     format.html
     format.js
   end
  end

  def destroy


    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    if @comment.destroy
      flash[:notice] = "Comment was removed."

    else
      flash[:error] = "Comment couldn't be deleted. Try again."

    end

    respond_to do |format|
     format.html
     format.js
    end
  end
  private

   def comment_params
     params.require(:comment).permit(:content)
   end
end
