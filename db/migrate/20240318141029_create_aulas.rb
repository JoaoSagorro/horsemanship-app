class CreateAulas < ActiveRecord::Migration[7.1]
  def change
    create_table :aulas do |t|
      t.string :title
      t.string :description
      t.string :class_type
      t.string :comments
      t.date :occurs_date
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
