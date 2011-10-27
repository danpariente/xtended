class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, :class_name => "User"    
  attr_accessible :user_id, :friend_id
  
  after_create :add_activity
  
  def add_activity
    Activity.create(:user_id => user.id, :activity_type => 'relationship', :text => "<a href='/user/#{user.username}'>#{user.username}</a> and <a href='/user/#{user.inverse_friends.last.username}'>#{user.inverse_friends.last.username}</a> are now friends.")    
  end 
  
end
