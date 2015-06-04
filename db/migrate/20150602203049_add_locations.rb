class AddLocations < ActiveRecord::Migration
  def up
    create_table :locations do |t|
    t.string :name
    t.text :description
    t.decimal :lat
    t.decimal :long
    t.references :locatable, polymorphic: true, index: true
    t.timestamps null: false
    end
  end

  def down
    remove_table :locations
  end
end
