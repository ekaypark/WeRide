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
  has_many :payout_infos
  has_many :invoices

  enum role: [ :user, :host, :admin]


  # probably unsuitable staying here. maybe a service will do & also cache.
  def upcoming_reservations
    upcoming = []
    reservations.each do |r|
      if r.schedule.start_at >= Time.now
        upcoming.push(r)
      end
    end
    upcoming.sort_by { |r| r.schedule.start_at }
  end

  def passed_reservations
    passed = []
    reservations.each do |r|
      if r.schedule.start_at < Time.now
        passed.push(r)
      end
    end
    passed.sort_by { |r| r.schedule.start_at }
  end

  def full_name
    last_name + first_name
  end
end
