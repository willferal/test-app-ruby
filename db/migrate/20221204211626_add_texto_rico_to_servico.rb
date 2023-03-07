class AddTextoRicoToServico < ActiveRecord::Migration[7.0]
  include ActionView::Helpers::TextHelper
  def change
    add_column :servicos, :texto_aprovado, :boolean
    rename_column :servico_detalhes, :descricao, :descricao_old
    ServicoDetalhe.all.each do |sd|
      sd.update_attribute(:descricao, simple_format(sd.descricao_old))
    end
    remove_column :servico_detalhes, :descricao_old
  end
end
