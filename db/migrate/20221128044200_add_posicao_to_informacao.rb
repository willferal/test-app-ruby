class AddPosicaoToInformacao < ActiveRecord::Migration[7.0]
  def change
    add_column :informacoes, :posicao, :integer
    Informacao.order(:titulo).each.with_index(1) do |informacao, index|
      informacao.update_column :posicao, index
    end
  end
end
