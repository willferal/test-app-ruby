class CreateEntidades < ActiveRecord::Migration[7.0]
  def change
    create_table :entidades do |t|
      t.string :nome, null: false
      t.string :cpf_cnpj, null: false
      t.string :razao_social
      t.string :endereco
      t.string :numero_endereco
      t.string :complemento_endereco
      t.string :bairro_endereco
      t.references :municipio, foreign_key: true
      t.references :tipo_entidade, null: false, foreign_key: true
      t.references :origem, null: false, foreign_key: true

      t.timestamps
      t.datetime :deleted_at
    end
  end
end
