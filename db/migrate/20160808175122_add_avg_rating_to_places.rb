class AddAvgRatingToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :avg_rating, :integer
  end
end
