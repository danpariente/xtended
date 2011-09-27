class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def new
  	@user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Successfully created User." 
      redirect_to users_path
    else
      render :action => 'new'
    end
  end

  def show
  	@user = User.find(params[:id])
  end
  
  def show_by_username 
  	@user = User.find_by_username(params[:username])
  	render :action => 'show'
  end
  
  #[TODO] add some enable / disable method for admins

  def edit
    @user = User.find(params[:id])
  end

   def update
    @user = User.find(params[:id])
    params[:user].delete(:password) if params[:user][:password].blank?
    params[:user].delete(:password_confirmation) if params[:user][:password].blank? and params[:user][:password_confirmation].blank?
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated User."
      redirect_to users_path
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_url, :notice => "Successfully destroyed user."
  end

end
