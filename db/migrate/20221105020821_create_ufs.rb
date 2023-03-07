class CreateUfs < ActiveRecord::Migration[7.0]
  def change
    create_table :ufs do |t|
      t.string :descricao, null: false
      t.string :sigla

      t.timestamps
      t.datetime :deleted_at
    end
  end
end
