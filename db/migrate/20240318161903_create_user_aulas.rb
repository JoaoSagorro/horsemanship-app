class CreateUserAulas < ActiveRecord::Migration[7.1]
  def change
    create_table :user_aulas do |t|
      t.references :user, null: false, foreign_key: true
      t.references :aula, null: false, foreign_key: true

      t.timestamps
    end
  end
end
