class AddDefaultToValidatedInBookings < ActiveRecord::Migration[5.2]
  def change
    change_column :bookings, :validated, :boolean, default: false
  end
end
