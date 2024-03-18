class AddBookedToAulas < ActiveRecord::Migration[7.1]
  def change
    add_column :aulas, :booked, :boolean, default: false
  end
end
