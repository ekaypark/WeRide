class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.integer :member_id
      t.integer :schedule_id
      t.integer :participant_count
      t.timestamps
    end
  end
end
