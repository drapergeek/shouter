class PhotoShout < ActiveRecord::Base
  has_attached_file :photo, styles: {
    thumb: "200x200"
  }
  has_one :shout, as: :medium
end
