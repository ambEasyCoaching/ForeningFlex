class AddInformationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :roles_mask, :integer
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :gender, :boolean
    add_column :users, :birth_day, :date
  end
end
