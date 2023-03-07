class AlterNameColumnOrdem < ActiveRecord::Migration[7.0]
  def change
    rename_column :modulo_detalhes, :ordem, :posicao
    rename_column :informacao_detalhes, :ordem, :posicao
  end
end
