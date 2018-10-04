class AddSettingFieldsToActivityTable < ActiveRecord::Migration[5.2]
  def change
    add_column :activities, :alcohol_served, :boolean, default: false
    add_column :activities, :minimum_age, :integer
    add_column :activities, :how_active, :integer
    add_column :activities, :additional_requirement, :text
    add_column :activities, :id_required, :boolean, default: false
    add_column :activities, :group_size, :integer
    add_column :activities, :total_time, :integer
  end
end
