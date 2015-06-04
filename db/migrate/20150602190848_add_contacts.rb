class AddContacts < ActiveRecord::Migration
  def up
    create_table :contacts do |t|
    t.string :firstname
    t.string :lastname
    t.timestamps null: false
    end
  end

  def down
    remove_table :contacts
  end
end
