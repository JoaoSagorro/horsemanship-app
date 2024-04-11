class AddTeacherToAulasDb < ActiveRecord::Migration[7.1]
  def change
      add_column :aulas, :teacher, :string
  end
end
