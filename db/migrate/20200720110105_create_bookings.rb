class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.integer :time
      t.string :appointment_type
      t.string :name
      t.string :email
      t.integer :phone_number

      t.timestamps
    end
  end
end
