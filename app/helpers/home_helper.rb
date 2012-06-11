module HomeHelper
  def getting_started? 
  	current_user.profile
  end


  def smart_profile
    getting_started? ?  "/profiles/#{current_user.profile.id}" : '/profiles/new' 
  end		
end
