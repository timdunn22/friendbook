class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @like = Like.find_by(post_id: @post.id, user_id: current_user.id)

  end
  def edit
    @post = Post.find(params[:id])
  end
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = "Post was saved."
      redirect_to posts_path
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end
  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(post_params)
      flash[:notice] = "Post was updated"
      redirect_to posts_path
    else
      flash[:error] = "Invalid Post information"
      render :edit
    end
  end
  def destroy
    @post = Post.find(params[:id])
    

    if @post.destroy
      flash[:notice] = "\"#{@post.title}\" was deleted successfully."
      redirect_to posts_path
    else
      flash[:error] = "There was an error deleting the post."
      render :show
    end
  end
  def new
    @post = Post.new
  end
  def index
    @posts = current_user.visible_posts

  end
  private

  def post_params
    params.require(:post).permit(:title, :body, :image, :image_cache)
  end
end
