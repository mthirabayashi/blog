class Follow < ApplicationRecord
  validates :following_id, presence: true
  validates :following_id, uniqueness: {scope: :follower_id}

  belongs_to :person_getting_followed,
    class_name: "User",
    foreign_key: :following_id,
    primary_key: :id

  belongs_to :person_following,
    class_name: "User",
    foreign_key: :follower_id,
    primary_key: :id
end
