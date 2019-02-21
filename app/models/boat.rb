class Boat < ApplicationRecord
  has_many :bookings
  belongs_to :user
  mount_uploader :photo, PhotoUploader
  mount_uploaders :other_photos, PhotoUploader
end
