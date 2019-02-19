class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :bookings

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates :first_name, presence: true, allow_blank: false
  # validates :last_name, presence: true, allow_blank: false
  # validates :email, presence: true, uniqueness: true, allow_blank: false
  # validates :rating, numericality: true
end
