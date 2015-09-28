class AddAssociatedProjectIdToParticipations < ActiveRecord::Migration
  def change
    add_column :participations, :associated_project_id, :integer
  end
end
