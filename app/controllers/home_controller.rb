class HomeController < ApplicationController
  def show
  	@user = current_user
    if @user
      #redirect_to :controller => 'aspects', :action => 'index'
      #:controller => 'pages', :action => 'index' 
      render :landing#redirect_to current_user
    else
      @landing_page = true
      #@user = User.new(:username => Digest::MD5.hexdigest(Time.now.to_s))
      #render :landing
      render :show
    end
  end
  
  def landing 
    @user = current_user
    @myself = @user
    @post = Post.new
  	#@viewed_user = User.find_by_username(params[:username])
  	@viewed_user = User.find(params[:id])
  	@viewing_self = (@viewed_user == @myself)
  	all = [] 
    @all = all
  end
  
  def after_login
  	user = current_user 
    if user.new_record?
      photo = user[:photo].nil? ? "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user[:email])}" : user[:photo] 
      unless user.update_attributes({ :username => user[:username].hash.to_s(36), :email => user[:email], :photo_url => photo })
        flash[:error] = user.errors.values.join(",")
        redirect_to root_url
      end      
      session[:user_id] = user.id
      redirect_to edit_user_path(current_user.id)	
    else
      session[:user_id] = user.id
      redirect_to root_url  
    end  	  
  end

end