class ChangeDatatypeOfTotalTimeFromIntegerToStringInActivityTable < ActiveRecord::Migration[5.2]
  def change
    change_column :activities, :total_time, :string
  end
end
