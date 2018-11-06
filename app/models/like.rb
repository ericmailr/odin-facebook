class Like < ApplicationRecord
    belongs_to :post
    belongs_to :liker, class_name: 'User'
    validates :post_id, presence: true
    validates :liker_id, presence: true
end
