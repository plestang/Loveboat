class AddAnotherPhotoToBoats < ActiveRecord::Migration[5.2]
  def change
    add_column :boats, :photo_3, :string
  end
end
