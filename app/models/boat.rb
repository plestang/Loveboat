class Boat < ApplicationRecord
  has_many :bookings
  belongs_to :user
  mount_uploader :photo, PhotoUploader
  mount_uploader :photo_2, PhotoUploader
  mount_uploader :photo_3, PhotoUploader
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  mount_uploaders :other_photos, PhotoUploader

  def unavailable_dates
    bookings.pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end
end
