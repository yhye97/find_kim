class FriendshipController < ApplicationController
  def invite
    friend = Friendship.new
    friend.friend_id=params[:receiver]
    friend.user_id=params[:requester]
    friend.pending=params[:bool]
    friend.save
    redirect_to root_url
  end
  
  def approve
    @friend=Friendship.all
    
  end


  def friendlist
   @friend=Friendship.all
  end

end
