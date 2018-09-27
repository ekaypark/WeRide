class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.integer :member_id
      t.string :location
      t.string :category
      t.text :intro
      t.text :overview
      t.string :address01
      t.string :address02
      t.string :zipcode
      t.integer :legal_requirement
      t.text :host_arrangement
      t.text :participant_preparation
      t.text :notes
      t.integer :price
      t.string :title
      t.timestamps
    end
  end
end
