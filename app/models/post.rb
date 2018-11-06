class Post < ApplicationRecord
    belongs_to :user
    has_many :likes, dependent: :destroy
    has_many :likers, through: :likes
    has_many :comments, dependent: :destroy
    validates :user_id, presence: true
    validates :body, presence: true
end
