module Commentable 
  def people_who_likes 
    self.likes.collect { |like| "<a href='/user/#{like.user.username}'>#{like.user.formatted_name}</a>" }	
  end
	
end