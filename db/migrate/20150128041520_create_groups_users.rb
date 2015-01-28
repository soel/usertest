class CreateGroupsUsers < ActiveRecord::Migration
  def change
    create_table :groups_users, id: false do |t|
      t.references :group, index: true, null: false
      t.references :user, index: true, null: false
    end
  end
end
