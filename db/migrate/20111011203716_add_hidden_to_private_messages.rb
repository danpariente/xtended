class AddHiddenToPrivateMessages < ActiveRecord::Migration
  def self.up
    add_column :private_messages, :r_hidden, :boolean
    add_column :private_messages, :s_hidden, :boolean
  end

  def self.down
    remove_column :private_messages, :s_hidden
    remove_column :private_messages, :r_hidden
  end
end
