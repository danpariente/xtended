class FixColumnName < ActiveRecord::Migration
  def self.up
  	rename_column :events, :date, :event_date
  	rename_column :events, :time, :event_time
  end

  def self.down
  	rename_column :events, :event_date, :date
  	rename_column :events, :event_time, :time
  end
end
