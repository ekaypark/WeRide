class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.integer :member_id
      t.integer :activity_id
      t.datetime :start_at
      t.datetime :end_at

      t.timestamps
    end
  end
end
