class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
  end
  def create
     @profile = Profile.new(profile_params)
     @profile.user_id = current_user.id
    if @profile.save
      flash[:notice] = "You have made a new profile!"
      redirect_to root_path
    else
      flash[:error] = "There was an error saving your profile"
      render :edit
    end
  end
  def edit
    @profile = Profile.find(params[:id])


  end
  def destroy
    @profile = Profile.find(params[:id])
    if @profile.destroy
      flash[:notice] = "You have destroyed your profile."
      redirect_to root_path
    else
      flash[:error] = "There was an error deleting your profile."
      render :edit
    end
  end
  def update
    @profile = Profile.find(params[:id])
    if @profile.update_attributes(profile_params)
      flash[:notice] = "You have updated profile!"
      redirect_to root_path
    else
      flash[:error] = "There was an error saving your profile"
      render :edit
    end
  end
  private
  def profile_params
    params.require(:profile).permit(:birthday,:location, :interests)
  end
end
