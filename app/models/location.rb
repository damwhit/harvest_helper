class Location < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode

  validates :address, presence: true
end
