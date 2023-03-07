class CreateModulos < ActiveRecord::Migration[7.0]
  def change
    create_table :modulos do |t|
      t.string :titulo
      t.string :descricao
      t.string :icone
      t.string :url
      t.boolean :ativo, default: true

      t.timestamps
    end
  end
end
