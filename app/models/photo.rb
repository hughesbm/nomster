class Photo < ActiveRecord::Base
  belongs_to :user
  belongs_to :place
  mount_uploader :picture, PictureUploader
  mount_uploader :thumb, PictureUploader
end
