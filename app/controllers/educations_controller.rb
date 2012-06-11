class EducationsController < ApplicationController
  def new
    @user = current_user  
  	@education = Education.new
	  @profile = Profile.find(params[:profile_id])
  end	
	
  def create 
  	@profile = Profile.find(params[:education][:profile_id])
    @education = @profile.educations.create(params[:education])
    redirect_to @profile
  end	  
end
