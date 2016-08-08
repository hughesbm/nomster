class Place < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders, :history]

  belongs_to :user
  has_many :comments
  has_many :photos

  geocoded_by :address
  after_validation :geocode

  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :address, presence: true, length: { minimum: 10, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10, maximum: 500 }

  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end
end
