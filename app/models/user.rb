class User < ActiveRecord::Base
  include Clearance::User
  has_many :shouts

  def create_shout(medium)
    new_shout = shouts.create(medium: medium)
  end

end
