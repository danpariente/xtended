class ApplicationController < ActionController::Base
  helper :all	
  protect_from_forgery
  rescue_from CanCan::AccessDenied do |exception| 
  	flash[:error] = "Access Denied"
  	redirect_to root_url
  end
end