class CreateInvoicesReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices_reservations, id: false do |t|
      t.belongs_to :reservation
      t.belongs_to :invoice
    end
  end
end
