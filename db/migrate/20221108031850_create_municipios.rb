class CreateMunicipios < ActiveRecord::Migration[7.0]
  def change
    create_table :municipios do |t|
      t.string :descricao, null: false
      t.references :uf, null: false, foreign_key: true

      t.timestamps
      t.datetime :deleted_at
    end
  end
end
