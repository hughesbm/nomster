class Place < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders, :history]

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :photos, dependent: :destroy

  geocoded_by :address
  after_validation :geocode

  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :address, presence: true, length: { minimum: 10, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10, maximum: 500 }

  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end

  def update_avg_rating
    @total = 0
    @count = self.comments.size
    self.comments.each do |comment|
      @total += comment.rating.chr.to_i
    end
    update_attributes(avg_rating: (@total.to_f / @count.to_f).to_i)
  end
end
