class Activity < ActiveRecord::Base
  has_many :comments, :as => :commentable	
  has_many :likes
  belongs_to :user
end
