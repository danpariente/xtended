class Page < ActiveRecord::Base
  include Commentable 	
  has_many :comments, :as => :commentable		
  has_many :likes, :as => :likeable
  #belongs_to :user
  #belongs_to :event
  #belongs_to :group
  belongs_to :pageable, :polymorphic  => true
	
  validates_presence_of :title, :body
  validates_length_of :title, :within => 3..255
  validates_length_of :body, :maximum => 10000
    
  after_create :add_activity

  def add_activity
    #if self.event
    #  Activity.create(:user => self.user, :activity_type => 'event page', :text => "<a href='/user/#{self.user.username}'>#{self.user.formatted_name}</a> created a page - <a href='/event/page/#{self.id}'>#{self.title}</a> for the event <a href='/event/#{self.event.id}'>#{self.event.name}</a>.") 
    #elsif self.group
    #  Activity.create(:user => self.user, :activity_type => 'group page', :text => "<a href='/user/#{self.user.username}'>#{self.user.formatted_name}</a> created a page - <a href='/group/page/#{self.id}'>#{self.title}</a> for the group <a href='/group/#{self.group.id}'>#{self.group.name}</a>.")       
    #else
    #  Activity.create(:user => self.user, :activity_type => 'page', :text => "<a href='/user/#{self.user.username}'>#{self.user.formatted_name}</a> created a page - <a href='/page/#{self.id}'>#{self.title}</a>.")
    #end
  end
    
    def before_create
      @attributes['permalink'] =
      title.downcase.gsub(/\s+/, '_').gsub(/[^a-zA-Z0-9_]+/, '')
    end
    
    def to_param
	  "#{id}-#{permalink}"
    end
end
