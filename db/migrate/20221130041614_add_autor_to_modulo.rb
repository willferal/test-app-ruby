class AddAutorToModulo < ActiveRecord::Migration[7.0]
  def change
    add_reference :modulos, :autor, foreign_key: { to_table: :users }
  end
end
