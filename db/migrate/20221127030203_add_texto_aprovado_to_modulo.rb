class AddTextoAprovadoToModulo < ActiveRecord::Migration[7.0]
  def change
    add_column :modulos, :texto_aprovado, :boolean, default: nil
  end
end
