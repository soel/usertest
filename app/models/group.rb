class Group < ActiveRecord::Base
  has_and_belongs_to_many :owner_users, :class_name => 'User', :association_foreign_key => 'owner_id'
  has_and_belongs_to_many :member_users, :class_name => 'User', :association_foreign_key => 'member_id'
  has_and_belongs_to_many :sales_users, :class_name => 'User', :association_foreign_key => 'sales_id'
end
