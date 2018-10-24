require 'test_helper'

class FriendshipTest < ActiveSupport::TestCase
    def setup
        @friendship = Friendship.new(user_id: User.first.id, friend_id: User.second.id)
    end

    test "should be valid" do
        assert @friendship.valid?
    end

    test "user_id should be present" do
        @friendship.user_id = " "
        assert_not @friendship.valid?
    end

    test "user_id should refer to real user" do
        @friendship.user_id = 1
        assert_not @friendship.valid?
    end
end
