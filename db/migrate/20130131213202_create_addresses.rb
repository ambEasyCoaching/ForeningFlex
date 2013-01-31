class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :address
      t.string :zip
      t.string :city
      t.string :phone
      t.string :mobile
      t.string :email

      t.timestamps
    end
  end
end
