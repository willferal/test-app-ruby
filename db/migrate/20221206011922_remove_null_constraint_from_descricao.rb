class RemoveNullConstraintFromDescricao < ActiveRecord::Migration[7.0]
  def up
    change_column :informacoes, :descricao, :string, null: true
    change_column :informacao_detalhes, :descricao, :string, null: true
  end

  def down
    change_column :informacoes, :descricao, :string, null: false
    change_column :informacao_detalhes, :descricao, :string, null: false
  end
end
