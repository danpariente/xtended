class ExperiencesController < ApplicationController
  def new
    @user = current_user  
  	@experience = Experience.new
	@profile = Profile.find(params[:profile_id])
  end	
	
  def create 
  	@profile = Profile.find(params[:experience][:profile_id])
    @experience = @profile.experiences.create(params[:experience])
    redirect_to profile_path(@profile)
  end	  
end
