class CreateEntidadesAtuacoes < ActiveRecord::Migration[7.0]
  def change
    create_table :entidade_atuacoes do |t|
      t.references :entidade, null: false, foreign_key: true
      t.references :atuacao, null: false, foreign_key: true

      t.timestamps
    end
  end
end
