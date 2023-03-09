class AddBookTimetoBooking < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :book_time, :time
  end
end
