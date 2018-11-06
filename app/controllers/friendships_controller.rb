class FriendshipsController < ApplicationController

    def create
        @friend = User.find(params[:user_id])
        @friendship = current_user.friendships.build(user_id: current_user.id, pending_friend_id: @friend.id)
        @friendship_inverse = @friend.friendships.build(user_id: @friend.id, requesting_friend_id: current_user.id)
        if @friendship.save && @friendship_inverse.save
            flash[:success] = "Friend Request Sent!"
        else
            flash[:failure] = "Error: Could not send request."
        end
        redirect_back(fallback_location: root_path)
    end

    def update
        @friend = User.find(params[:user_id])
        current_user.friendships
        friendship = current_user.friendships.find_by(requesting_friend_id: @friend.id).update(friend_id: @friend.id, requesting_friend_id: nil)
        friendship_inverse = @friend.friendships.find_by(pending_friend_id: current_user.id).update(friend_id: current_user.id, pending_friend_id: nil)
       # friendship.requesting_friend_id = nil
       # friendship.friend_id = @friend.id
       # friendship_inverse.pending_friend_id = nil
       # friendship_inverse.friend_id = current_user.id
        if friendship && friendship_inverse
            flash[:success] = "You're now friends!"
        else
            flash[:failure] = "Error: Could not become friends..."
        end
        redirect_back(fallback_location: root_path)
    end

end
