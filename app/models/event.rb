class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :wall
  has_many :pages, :as  => :pageable
  has_many :confirms
  has_many :confirmed_users, :through => :confirms, :class_name => 'User', :foreign_key => 'event_id'#, :mutable => true
  has_many :pendings
  has_many :pending_users, :through => :pendings, :class_name => 'User', :foreign_key => 'event_id'
  has_many :declines
  has_many :declined_users, :through => :declines, :class_name => 'User', :foreign_key => 'event_id'

  #attr_accessible :confirmed_users, :pending_users, :declined_users NO WAY U CAN'T ADD THIS
  
  after_create :create_wall
  after_create :add_activity
  
  def create_wall
    self.wall = Wall.create
    self.save
  end

  def add_activity
    Activity.create(:user_id => self.user.id, :activity_type => 'event', :text => "<a href='/user/#{self.user.username}'>#{self.user.username}</a> created a new event - <a href='/event/#{self.id}'>#{self.name}</a>.")
  end	
end
