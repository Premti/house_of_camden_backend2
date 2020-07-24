class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.integer :time
      t.string :appointment_type
      t.string :name
      t.string :email
      t.string :phone_number
      t.string :date
      t.boolean :confirmed, :default => false
      t.string :message

      t.timestamps
    end
  end
end
