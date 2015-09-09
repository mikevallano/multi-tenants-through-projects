class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.string :email
      t.integer :account_id
      t.integer :project_ids
      t.integer :role_ids
      t.integer :sender_id
      t.integer :receiver_id
      t.string :token

      t.timestamps null: false
    end
    add_index :invites, :token
  end
end
