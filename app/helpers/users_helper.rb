module UsersHelper
  def can_follow(user)
    current_user != user && !current_user.followed_users.include?(user)
  end
end
