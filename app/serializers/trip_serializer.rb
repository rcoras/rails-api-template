class TripSerializer < ActiveModel::Serializer
  attributes :id, :trip_date, :trip_length_hrs, :location, :no_of_fish_caught, :comments
  belongs_to :user
end
