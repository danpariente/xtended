class ReferencesController < ApplicationController
  def new
    @user = current_user
    @profile = Profile.find(params[:profile_id])	
  	@reference = Reference.new
  end	
	
  def create 
  	@profile = Profile.find(params[:reference][:profile_id])
    @reference = @profile.references.create(params[:reference])
    redirect_to @profile
  end	  
end
