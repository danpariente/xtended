class CompetenciesController < ApplicationController
  def new
    @user = current_user
    @profile = Profile.find(params[:profile_id])	
  	@competency = Competency.new
  end	
	
  def create 
  	@profile = Profile.find(params[:competency][:profile_id])
    @competency = @profile.competencies.create(params[:competency])
    redirect_to @profile
  end	  
end
