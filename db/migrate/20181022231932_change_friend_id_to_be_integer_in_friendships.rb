class ChangeFriendIdToBeIntegerInFriendships < ActiveRecord::Migration[5.1]
  def change
      change_column :friendships, :friend_id, 'integer USING CAST(friend_id AS integer)'
  end
end
