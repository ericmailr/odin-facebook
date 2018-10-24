class CreateFriendRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :friend_requests do |t|
      t.string :requester_id
      t.string :requested_friend_id

      t.timestamps
    end
  end
end
