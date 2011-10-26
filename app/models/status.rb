class Status < ActiveRecord::Base
  include Commentable
  	
  has_many :comments 	
  has_many :likes 
end
