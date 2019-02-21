class AddParamsToBoats < ActiveRecord::Migration[5.2]
  def change
    add_column :boats, :name, :string
    add_column :boats, :capacity, :integer
    add_column :boats, :cabin, :integer
    add_column :boats, :length, :integer
    add_column :boats, :address, :string

  end
end
