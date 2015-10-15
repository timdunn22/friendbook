class FriendshipsController < ApplicationController
  def new
    @friendship = Friendship.new
    @friendships = User.all - [current_user] -   current_user.friends
  end

  def create
    @friendship = current_user.friendships.build(friendship_params)
    if @friendship.save
      flash[:success] = "You have made a new friend!"
      redirect_to root_path
    else
      flash[:error] = "There was an error added your friend"
      render :edit
    end
  end

  def destroy
  end
  private
  def friendship_params
    params.require(:friendship).permit(:user_id,:friend_id)
  end
end
