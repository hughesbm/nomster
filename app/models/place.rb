class Place < ActiveRecord::Base
  belongs_to :user
  validates :name, length: { minimum: 3, maximum: 50 }, presence: true
  validates :address, length: { minimum: 10, maximum: 100 }, presence: true
  validates :description, length: { minimum: 10, maximum: 500 }, presence: true
end
