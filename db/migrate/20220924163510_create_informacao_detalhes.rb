class CreateInformacaoDetalhes < ActiveRecord::Migration[7.0]
  def change
    create_table :informacao_detalhes do |t|
      t.string :descricao, null: false
      t.string :titulo, null: false
      t.references :informacao, null: false, foreign_key: true
      t.integer :ordem, null: false
      t.timestamps
      t.datetime :deleted_at
    end
  end
end
