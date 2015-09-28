class RemoveColumnsFromMemberships < ActiveRecord::Migration
  def change
    remove_column :memberships, :project_id
    remove_column :memberships, :role_id
    remove_column :memberships, :user_id
  end
end
