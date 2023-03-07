class AddDeletedAtToModulo < ActiveRecord::Migration[7.0]
  def change
    add_column :modulos, :deleted_at, :datetime
  end
end
