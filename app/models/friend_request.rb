class FriendRequest < ApplicationRecord
    belongs_to :user, :foreign_key => :requested_friend_id 
    validates :requester_id, presence: true
    validates :requested_friend_id, presence: true
end
