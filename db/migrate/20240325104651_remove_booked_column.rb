class RemoveBookedColumn < ActiveRecord::Migration[7.1]
  def change
    remove_column :aulas, :booked
  end
end
