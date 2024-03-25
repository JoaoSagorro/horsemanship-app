class AddSpotsToAulas < ActiveRecord::Migration[7.1]
  def change
    add_column :aulas, :spots, :integer
  end
end
