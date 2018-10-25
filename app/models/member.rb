class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, :dob, :email, presence: true
  validates :email, uniqueness: true

  has_many :activities
  has_many :schedules
  has_many :reservations

  enum role: [ :user, :host, :admin]
end
