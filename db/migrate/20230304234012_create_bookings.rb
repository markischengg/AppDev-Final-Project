class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.datetime :time
      t.float :duration

      t.timestamps
    end
  end
end
