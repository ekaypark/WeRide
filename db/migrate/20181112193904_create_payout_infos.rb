class CreatePayoutInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :payout_infos do |t|
      t.string :bank_name
      t.string :account_holder_name
      t.integer :account_number, limit: 8
      t.integer :member_id
      t.boolean :default_use, default: false

      t.timestamps
    end
  end
end
