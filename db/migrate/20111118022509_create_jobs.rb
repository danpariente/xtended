class CreateJobs < ActiveRecord::Migration
  def self.up
    create_table :jobs do |t|
      t.string :job_title
      t.string :job_type
      t.string :job_category
      t.string :working_location
      t.text :responsability
      t.string :lowest_education_level
      t.string :highest_education_level
      t.integer :age_min
      t.integer :age_max
      t.string :salary_min
      t.string :salary_max
      t.boolean :negotiable
      t.boolean :travel
      t.boolean :relocate
      t.integer :user_id
      t.integer :company_id
      t.string  :address
      t.float  :longitude
      t.float  :latitude
      t.timestamps
    end
  end

  def self.down
    drop_table :jobs
  end
end
