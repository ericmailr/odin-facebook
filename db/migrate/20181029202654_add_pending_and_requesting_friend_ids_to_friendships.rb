class AddPendingAndRequestingFriendIdsToFriendships < ActiveRecord::Migration[5.1]
  def change
    add_column :friendships, :pending_friend_id, :integer
    add_column :friendships, :requesting_friend_id, :integer
  end
end
