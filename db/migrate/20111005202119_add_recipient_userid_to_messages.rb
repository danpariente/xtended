class AddRecipientUseridToMessages < ActiveRecord::Migration
  def self.up
    add_column :messages, :recipient_id, :integer
    add_column :messages, :user_id, :integer
  end

  def self.down
    remove_column :messages, :user_id
    remove_column :messages, :recipient_id
  end
end
