class AddAssociatedAccountToMemberships < ActiveRecord::Migration
  def change
    add_column :memberships, :associated_account_id, :integer
  end
end
