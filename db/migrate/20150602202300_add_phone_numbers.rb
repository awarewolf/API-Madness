class AddPhoneNumbers < ActiveRecord::Migration
  def up
    create_table :phone_numbers do |t|
    t.references :contact
    t.string :number
    t.timestamps null: false
    end
  end

  def down
    remove_table :phone_numbers
  end
end
