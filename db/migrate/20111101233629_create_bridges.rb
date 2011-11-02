class CreateBridges < ActiveRecord::Migration
  def self.up
    create_table :bridges do |t|
      t.integer :event_id
      t.integer :person_id

      t.timestamps
    end
  end

  def self.down
    drop_table :bridges
  end
end
