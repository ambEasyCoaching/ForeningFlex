class CreateClubs < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
      t.string :name
      t.string :initials
      t.integer :contact_person
      t.attachment :logo
      t.string :website
      t.string :cvr
      t.string :sport
      t.string :merchant_number
      t.integer :sms_counter, :default => 0
      t.string :street_name
      t.string :street_number
      t.string :zip
      t.string :city

      t.timestamps
    end
  end
end
