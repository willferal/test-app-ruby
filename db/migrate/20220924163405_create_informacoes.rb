class CreateInformacoes < ActiveRecord::Migration[7.0]
  def change
    create_table :informacoes do |t|
      t.string :descricao, null: false
      t.string :titulo, null: false
      t.references :situacao, null: false, foreign_key: true
      t.string :state, null: false
      t.timestamps
      t.datetime :deleted_at
    end
  end
end
