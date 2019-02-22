class AddOtherPhotoToBoats < ActiveRecord::Migration[5.2]
  def change
    add_column :boats, :photo_2, :string
  end
end
