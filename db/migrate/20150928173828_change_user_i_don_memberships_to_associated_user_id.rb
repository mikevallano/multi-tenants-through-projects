class ChangeUserIDonMembershipsToAssociatedUserId < ActiveRecord::Migration
  def change
    rename_column :memberships, :user_id, :associated_user_id
  end
end
