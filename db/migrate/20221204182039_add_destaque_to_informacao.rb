class AddDestaqueToInformacao < ActiveRecord::Migration[7.0]
  def change
    add_column :informacoes, :destaque, :boolean, null: false, default: false
  end
end
