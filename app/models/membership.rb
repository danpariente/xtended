class Membership < ActiveRecord::Base
  belongs_to :user	
  belongs_to :member, :class_name => 'User', :foreign_key => 'user_id'	
  belongs_to :group, :foreign_key => 'group_id'
end
