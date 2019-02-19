class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :bookings
  has_many :boats

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates :first_name, presence: true, allow_blank: false
  # validates :last_name, presence: true, allow_blank: false
<<<<<<< HEAD
  # validates :email, presence: true, uniqueness: true, allow_blank: false
  # validates :rating, numericality: true
=======
  # validates :rating, numericality: true
  #  validates :email, presence: true, uniqueness: true, allow_blank: false

  mount_uploader :photo, PhotoUploader
>>>>>>> fefe9b8d5c10bb7f97df6a66dd63ef6f0e9b5096
end
