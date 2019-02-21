class Boat < ApplicationRecord
  has_many :bookings
  belongs_to :user

  mount_uploader :photo, PhotoUploader

  def unavailable_dates
    bookings.pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end
end
