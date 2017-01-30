class AddIndexToFollows < ActiveRecord::Migration[5.0]
  def change
    add_index :follows, :following_id
    add_index :follows, :follower_id
  end
end
