class AddStatusToReservation < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :status, :integer, default: 0
    add_column :reservations, :confirmed_at, :datetime
    add_column :reservations, :cancel_requested_at, :datetime
    add_column :reservations, :cancel_verdict_at, :datetime
  end
end
