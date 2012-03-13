class User < ActiveRecord::Base
  include Clearance::User
  has_many :shouts

  has_many :following_relationships, foreign_key: "following_user_id"
  has_many :followed_users, through: :following_relationships


  def create_shout(medium)
    new_shout = shouts.create(medium: medium)
  end

  def follow(followed_user)
    following_relationships.create(followed_user: followed_user)
  end

end
