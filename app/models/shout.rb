class Shout < ActiveRecord::Base
  belongs_to :user
  belongs_to :medium, polymorphic: true

  delegate :email, :to=>:user, :prefix=>true

  def self.current
    order("created_at DESC")
  end

  def self.search(search)
    text_shouts = TextShout.where("UPPER(body) LIKE ?", "%#{search.upcase}%").collect(&:shout)
    photo_shouts = PhotoShout.where("UPPER(photo_file_name) LIKE ?", "%#{search.upcase}%").collect(&:shout)
    shouts = text_shouts + photo_shouts
  end

end
