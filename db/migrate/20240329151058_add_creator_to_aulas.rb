class AddCreatorToAulas < ActiveRecord::Migration[7.1]
  def change
    add_column :aulas, :creator, :string
  end
end
