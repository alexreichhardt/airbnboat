class ChangeTableName < ActiveRecord::Migration[5.2]
  def change
    drop_table :boat_reviews

    create_table :booking_reviews do |t|
      t.string :title
      t.text :content
      t.integer :rating
      t.references :user, foreign_key: true
      t.references :booking, foreign_key: true
      t.timestamps
    end
  end
end
