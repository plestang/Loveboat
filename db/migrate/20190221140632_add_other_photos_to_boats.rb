class AddOtherPhotosToBoats < ActiveRecord::Migration[5.2]
  def change
    add_column :boats, :other_photos, :json
  end
end
