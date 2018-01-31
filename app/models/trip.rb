class Trip < ApplicationRecord
  belongs_to :user
  validates :trip_date, :trip_length_hrs, :location, :no_of_fish_caught, presence: true
end
