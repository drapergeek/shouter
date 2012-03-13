class UsersController < ApplicationController

  def show
   @user = User.find(params[:id]) 
   @shouts = @user.shouts.current
   @following_relationship = FollowingRelationship.new(:followed_user_id=>@user.id)
  end
end
