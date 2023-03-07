class CreateServicos < ActiveRecord::Migration[7.0]
  def change
    create_table :servicos do |t|
      t.references :tipo_servico, null: false, foreign_key: true
      t.references :entidade, null: false, foreign_key: true
      t.date :vigencia_inicial
      t.date :vigencia_final
      t.string :observacoes

      t.timestamps
      t.datetime :deleted_at
    end
  end
end
