class RemoverDescricaoDeModuloDetalhe < ActiveRecord::Migration[7.0]
  def change
    remove_column :modulo_detalhes, :descricao
  end
end
