class CreateTipoDetalhes < ActiveRecord::Migration[7.0]
  def change
    create_table :tipo_detalhes do |t|
      t.string :descricao, null: false

      t.timestamps
      t.datetime :deleted_at
    end
  end
end
