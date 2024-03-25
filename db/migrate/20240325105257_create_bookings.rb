class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.integer :attendees, default: 1
      t.boolean :status, default: false
      t.references :user, null: false, foreign_key: true
      t.references :aula, null: false, foreign_key: true

      t.timestamps
    end
  end
end
