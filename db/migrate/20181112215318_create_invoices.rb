class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|

      t.integer :schedule_id
      t.integer :member_id
      t.integer :status, default: 0
      t.datetime :paid_out_at
      t.integer :total_amount

      t.timestamps
    end
  end
end
