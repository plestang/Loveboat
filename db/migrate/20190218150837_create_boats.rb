class CreateBoats < ActiveRecord::Migration[5.2]
  def change
    create_table :boats do |t|
      t.integer :price_per_day
      t.string :category
      t.text :description

      t.timestamps
    end
  end
end
