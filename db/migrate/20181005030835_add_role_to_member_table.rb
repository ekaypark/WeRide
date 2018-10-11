class AddRoleToMemberTable < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :role, :integer, default: 0
  end
end
