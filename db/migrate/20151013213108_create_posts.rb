class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :description
      t.integer :user_id
      t.string :title

      t.timestamps null: false
    end
    add_index :posts, :user_id
  end
end
