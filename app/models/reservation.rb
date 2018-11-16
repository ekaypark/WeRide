class Reservation < ApplicationRecord
  after_save :persist_invoice

  belongs_to :member
  belongs_to :schedule
  has_and_belongs_to_many :invoices


  validates :schedule_id, :participant_count, :member_id, presence: true

  enum status: [ :pending, :confirmed, :cancel_requested, :cancelled ]

  def total_price
    participant_count * schedule.activity.price
  end

  def persist_invoice
    if confirmed?
      unless Invoice.where(schedule_id: schedule).present?
        Invoice.create(schedule_id: schedule_id, member_id: schedule.member_id)
      end
    end
  end

end
