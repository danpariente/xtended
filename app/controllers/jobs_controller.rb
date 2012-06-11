class JobsController < ApplicationController#< InheritedResources::Base
   def index
    @user = current_user
  	@jobs = Job.all
  	respond_to do |format| 
  	  format.html
  	  format.json { render :json => @jobs.map(&:attributes)}#.each {|h| h.dup.map { |k,v| [k.gsub!("jobname", "name"), v] }} }	
  	end
  end

  def new
    @user = current_user
  	@job = Job.new
  end

  def create
    @job = Job.new(params[:job])
    if @job.save
      flash[:notice] = "Successfully created job." 
      redirect_to @job, :notice => 'Successfully registered. You can join with your account now...'
    else
      flash[:notice] = "Couldn't create job." 	
      render :action => 'new'
    end
  end

  def show
  	@job = Job.find(params[:id])
  	@user = current_user
  end
  
  def edit
    @user = current_user
    @job = Job.find(params[:id])
  end

   def update
    @job = Job.find(params[:id])
    
    if @job.update_attributes(params[:job])
      flash[:notice] = "Successfully updated job."
      redirect_to jobs_path
    else
      render :action => 'edit'
    end
  end
  
 
  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to jobs_url, :notice => "Successfully destroyed job."
  end	
end
