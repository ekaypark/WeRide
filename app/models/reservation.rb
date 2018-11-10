class Reservation < ApplicationRecord
  belongs_to :member
  belongs_to :schedule

  validates :schedule_id, :participant_count, :member_id, presence: true

  enum status: [ :pending, :confirmed, :cancel_requested, :cancelled ]

  def total_price
    participant_count * schedule.activity.price
  end
end
