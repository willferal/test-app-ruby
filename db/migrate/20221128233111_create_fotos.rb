class CreateFotos < ActiveRecord::Migration[7.0]
  def change
    create_table :fotos do |t|
      t.string :nome_arquivo
      t.string :token
      t.references :servico, null: false, foreign_key: true
      t.string :titulo

      t.timestamps
      t.datetime :deleted_at
    end
  end
end
