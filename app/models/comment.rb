class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :place
  after_create :send_comment_email
  after_save :update_place_avg_rating

  validates :rating, presence: true
  validates :message, presence: true, length: { minimum: 10, maximum: 500 }

  RATINGS = {
    'One Star'    => '1_star',
    'Two Stars'   => '2_stars',
    'Three Stars' => '3_stars',
    'Four Stars'  => '4_stars',
    'Five Stars'  => '5_stars'
  }

  def humanized_rating
    RATINGS.invert[self.rating]
  end

  def send_comment_email
    NotificationMailer.comment_added(self).deliver
  end

  def update_place_avg_rating
    place.update_avg_rating
  end
end
