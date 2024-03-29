class AddCreatorToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :creator, :string
  end
end
