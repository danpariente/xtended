class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.column :title, :string
	  t.column :permalink, :string
	  t.column :body, :text
      t.timestamps
    end
    Page.create(:title => "Jobster Home",
				:permalink => "welcome-page",
				:body => "Welcome to Jobster")
  end

  def self.down
    drop_table :pages
  end
end
