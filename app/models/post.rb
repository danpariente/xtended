class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :wall
  #has_many :comments	
  has_many :likes
end
