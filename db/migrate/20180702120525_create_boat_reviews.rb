class CreateBoatReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :boat_reviews do |t|
      t.string :title
      t.text :content
      t.integer :rating
      t.references :boat, foreign_key: true
      t.references :user, foreign_key: true
      t.references :booking, foreign_key: true

      t.timestamps
    end
  end
end
