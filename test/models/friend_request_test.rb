require 'test_helper'

class FriendRequestTest < ActiveSupport::TestCase
    def setup
        @friend_request = FriendRequest.new(requester_id: User.first.id, requested_friend_id: User.second.id)
    end

    test "should be valid" do
        assert @friend_request.valid?
    end

    test "requester_id should be present" do
        @friend_request.requester_id = " "
        assert_not @friend_request.valid?
    end

end
