class AddConfirmedReservationIdsToInvoices < ActiveRecord::Migration[5.2]
  def change
    add_column :invoices, :confirmed_reservation_ids, :text, array: true, default: []
  end
end
