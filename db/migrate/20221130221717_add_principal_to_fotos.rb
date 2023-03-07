class AddPrincipalToFotos < ActiveRecord::Migration[7.0]
  def change
    add_column :fotos, :principal, :boolean
  end
end
