class AddIndexToFollows < ActiveRecord::Migration[5.0]
  def change
    add_index :follows, :followed_id
    add_index :follows, :follower_id
  end
end
