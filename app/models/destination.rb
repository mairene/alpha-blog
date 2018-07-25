class Destination < ApplicationRecord
  has_many :articles
  belongs_to :country
  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
end
