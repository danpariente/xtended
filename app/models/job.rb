class Job < ActiveRecord::Base
  attr_accessible :job_title, :job_type, :job_category, :working_location, :responsability, 
  :lowest_education_level, :highest_education_level, :age_min, :age_max, :salary_min, :salary_max,
  :negotiable, :travel, :relocate, :address, :latitude, :longitude	
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?			
end
