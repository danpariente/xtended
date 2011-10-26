class Photo < ActiveRecord::Base
  has_many :comments, :as => :commentable
  has_many :likes
end
