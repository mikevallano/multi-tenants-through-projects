class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.string :name
      t.string :description
      t.string :slug
      t.references :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
