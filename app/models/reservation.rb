class Reservation < ApplicationRecord
  belongs_to :member
  belongs_to :schedule

  validates :schedule_id, :participant_count, :member_id, presence: true
end
