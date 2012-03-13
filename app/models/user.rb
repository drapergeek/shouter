class User < ActiveRecord::Base
  include Clearance::User
  has_many :shouts

  has_many :followed_user_relationships, foreign_key: "following_user_id", class_name: "FollowingRelationship"
  has_many :followed_users, through: :followed_user_relationships

  has_many :following_user_relationships, foreign_key: "followed_user_id", class_name: "FollowingRelationship"
  has_many :followers, through: :following_user_relationships, source: :following_user


  def create_shout(medium)
    new_shout = shouts.create(medium: medium)
  end

  def follow(followed_user)
    followed_users << followed_user
  end

  def can_follow?(user)
    !self_and_followed_user_ids.include?(user.id)
  end

  def can_unfollow?(user)
    followed_user_ids.include?(user.id)
  end

  private
  def self_and_followed_user_ids
    [id] + followed_user_ids 
  end
end
