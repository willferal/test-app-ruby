class AddPosicaoToModulo < ActiveRecord::Migration[7.0]
  def change
    add_column :modulos, :posicao, :integer
    Modulo.order(:updated_at).each.with_index(1) do |modulo, index|
      modulo.update_column :posicao, index
    end
  end
end
