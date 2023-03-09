class AddCourtIdtoBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :court_id, :integer
  end
end
