class AddRecipientToPrivateMessages < ActiveRecord::Migration
  def self.up
    add_column :private_messages, :recipient, :string
    add_column :private_messages, :recipient_id, :integer
    add_column :private_messages, :user_id, :integer
  end

  def self.down
    remove_column :private_messages, :recipient
    remove_column :private_messages, :recipient_id, :integer
    remove_column :private_messages, :user_id, :integer
  end
end
