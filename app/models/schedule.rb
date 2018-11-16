class Schedule < ApplicationRecord
  belongs_to :member
  belongs_to :activity
  has_many :reservations
  has_one :invoice

  validates :member_id, :activity_id, :start_at, :end_at, presence: true

  def start_time
      self.start_at ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
  end

  def end_time
      self.end_at ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
  end

  def date
    start_at.strftime("%m/%d/%Y")
  end

  def time_range
    "#{start_at.strftime("%H:%M %p")} - #{end_at.strftime("%H:%M %p")}"

  end
end
