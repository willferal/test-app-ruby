class CreateAtuacoes < ActiveRecord::Migration[7.0]
  def change
    create_table :atuacoes do |t|
      t.string :descricao, null: false

      t.timestamps
      t.datetime :deleted_at
    end
  end
end
