class AddLikerIdToLikes < ActiveRecord::Migration[5.1]
  def change
    add_column :likes, :liker_id, :integer
  end
end
