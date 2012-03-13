class UsersController < ApplicationController

  def show
   @user = User.find(params[:id])
   @shout_feed = @user.shout_feed
   @following_relationship = FollowingRelationship.new(:followed_user_id=>@user.id)
  end
end
