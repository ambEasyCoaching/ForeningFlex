class RenameContactPersonToContactPersonId < ActiveRecord::Migration
  def up
    rename_column :clubs, :contact_person, :contact_person_id
    add_column :clubs, :contact_person_type, :string
  end

  def down
    rename_column :clubs, :contact_person_id, :contact_person
    remove_column :clubs, :contact_person_type
  end
end
