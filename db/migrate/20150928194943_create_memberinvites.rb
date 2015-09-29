class CreateMemberinvites < ActiveRecord::Migration
  def change
    create_table :memberinvites do |t|
      t.string :email
      t.integer :account_id
      t.integer :sender_id
      t.integer :receiver_id
      t.string :member_token

      t.timestamps null: false
    end
  end
end
