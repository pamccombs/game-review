class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :game_id
      t.string :title
      t.string :body
      t.integer :rating

      t.timestamps
    end
  end
end
