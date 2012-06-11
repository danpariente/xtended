class LanguagesController < ApplicationController
  def new
    @user = current_user
	@profile = Profile.find(params[:profile_id])
  	@language = Language.new
  end	
	
  def create 
  	@profile = Profile.find(params[:language][:profile_id])
    @language = @profile.languages.create(params[:language])
    redirect_to @profile
  end	  
end
