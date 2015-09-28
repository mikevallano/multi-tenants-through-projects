class AddAssociatedUserIDtoParticipations < ActiveRecord::Migration
  def change
    add_column :participations, :associated_user_id, :integer
  end
end
