class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :title, limit: 100, null: false
      t.text :description
      t.float :latitude, null: false
      t.float :longitude, null: false

      t.timestamps
    end
  end
end
