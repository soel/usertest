class CreateCreateGroupsUsers < ActiveRecord::Migration
  def change
    create_table :groups_users, id: false do |t|
      t.integer :owner_id
      t.integer :member_id
      t.integer :sales_id

      t.integer :group_id
      
      t.timestamps
    end
  end
end
