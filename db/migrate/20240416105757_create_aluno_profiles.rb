class CreateAlunoProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :aluno_profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :morada
      t.date :birthdate
      t.integer :nif
      t.integer :numero_utente
      t.integer :cartao_cidadao
      t.date :validity
      t.integer :contacto
      t.string :encarregado_educação
      t.string :grau_parentesco
      t.integer :contacto_emergencia
      t.string :aulas
      t.string :horario_preferencial
      t.boolean :recolha_dados
      t.boolean :fotografias_captadas

      t.timestamps
    end
  end
end
