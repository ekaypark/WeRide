class Invoice < ApplicationRecord
  belongs_to :schedule
  belongs_to :member
  has_and_belongs_to_many :reservations

  enum status: [:pending, :complete]

  validates :schedule_id, :member_id, :status, presence: true #, :total_amount

  def pending!
    if complete?
      errors.add(:payment_final, "Cannot change final payment back.")
    end
    super
  end

  def complete!
    update_column(:total_amount, tentative_total_price)
    update_column(:confirmed_reservation_ids, confirmed_reservation_array)
    update_column(:paid_out_at, Time.now)
    super
  end

  def confirmed_reservation_array
    array = []
    schedule.reservations.each do |r|
      if r.confirmed?
        array.push(r.id)
      end
    end
    array
  end

  def tentative_total_price
    price = 0
    schedule.reservations.each do |r|
      if r.confirmed?
        price += r.total_price
      end
    end
    price
  end

end
