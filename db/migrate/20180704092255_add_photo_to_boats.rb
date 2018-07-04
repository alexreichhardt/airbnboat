class AddPhotoToBoats < ActiveRecord::Migration[5.2]
  def change
    add_column :boats, :photo, :string
  end
end
