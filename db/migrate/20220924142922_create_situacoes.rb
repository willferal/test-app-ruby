class CreateSituacoes < ActiveRecord::Migration[7.0]
  def change
    create_table :situacoes do |t|
      t.string :descricao, null: false, limit: 100
      t.timestamps
      t.datetime :deleted_at
    end
  end
end
