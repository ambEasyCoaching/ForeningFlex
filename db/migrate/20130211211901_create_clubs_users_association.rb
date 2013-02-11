class CreateClubsUsersAssociation < ActiveRecord::Migration
  def up
    create_table 'clubs_users', :id => false do |t|
      t.column :club_id, :integer
      t.column :user_id, :integer
    end
  end

  def down
    drop_table 'clubs_users'
  end
end
