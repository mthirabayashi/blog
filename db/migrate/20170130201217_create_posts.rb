class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :img_url
      t.text :body, null: false
      t.integer :author_id, null: false
    end
    add_index :posts, :author_id
  end
end
