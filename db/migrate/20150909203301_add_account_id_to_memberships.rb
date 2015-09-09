class AddAccountIdToMemberships < ActiveRecord::Migration
  def change
    add_column :memberships, :account_id, :integer
    add_index :memberships, :account_id
  end
end
