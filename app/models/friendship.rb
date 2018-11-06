class Friendship < ApplicationRecord
    belongs_to :user
    belongs_to :friend, :class_name => "User", optional: true
    belongs_to :pending_friend, :class_name => "User", optional: true
    belongs_to :requesting_friend, :class_name => "User", optional: true

    ### ADD : HAS_ONE REQUESTER, AND HAS_ONE REQUESTER

end
