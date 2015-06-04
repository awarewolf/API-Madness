class AddEmails < ActiveRecord::Migration
  def up
    create_table :emails do |t|
    t.references :contact
    t.string :address
    t.timestamps null: false
    end
  end

  def down
    remove_table :emails
  end
end
