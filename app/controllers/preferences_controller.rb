class PreferencesController < ApplicationController
  
  def new
    @user = current_user   
    @profile = Profile.find(params[:profile_id])
  	@preference = Preference.new
  end	
	
  def create 
  	@profile = Profile.find(params[:preference][:profile_id])
    @preference = @profile.create_preference(params[:preference])
    redirect_to @profile
  end	  
		
end
