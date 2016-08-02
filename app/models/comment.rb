class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :place

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
end
