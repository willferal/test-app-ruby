class AddPosicaoToFotos < ActiveRecord::Migration[7.0]
  def change
    add_column :fotos, :posicao, :integer

    Foto.order(:updated_at).each.with_index(1) do |foto, index|
      foto.update_column :posicao, index
    end
  end
end
