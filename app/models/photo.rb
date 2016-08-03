class Photo < ActiveRecord::Base
  belongs_to :user
  belongs_to :place
  mount_uploader :picture, PictureUploader

  validates :picture, presence: true
  validates :caption, presence: true, length: { minimum: 5, maximum: 50 }

end
