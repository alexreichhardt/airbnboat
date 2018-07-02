class CreateBoats < ActiveRecord::Migration[5.2]
  def change
    create_table :boats do |t|
      t.string :title
      t.text :description
      t.string :name
      t.integer :person_capacity
      t.integer :year
      t.integer :length
      t.string :fuel_type
      t.string :model
      t.string :horse_power
      t.integer :sleeps
      t.integer :fuel_capacity
      t.string :required_license
      t.integer :price
      t.date :start_date
      t.date :end_date
      t.string :city
      t.string :street
      t.string :location_details
      t.string :zipcode
      t.string :country
      t.string :engine
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
