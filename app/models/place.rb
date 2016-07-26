class Place < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  geocoded_by :address
  after_validation :geocode
  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :address, presence: true, length: { minimum: 10, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10, maximum: 500 }
end
