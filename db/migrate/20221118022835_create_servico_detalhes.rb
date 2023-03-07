class CreateServicoDetalhes < ActiveRecord::Migration[7.0]
  def change
    create_table :servico_detalhes do |t|
      t.references :servico, null: false, foreign_key: true
      t.references :tipo_detalhe, null: false, foreign_key: true
      t.string :titulo, null: false
      t.string :descricao, null: false
      t.integer :posicao, null: false

      t.timestamps
      t.datetime :deleted_at
    end
  end
end
