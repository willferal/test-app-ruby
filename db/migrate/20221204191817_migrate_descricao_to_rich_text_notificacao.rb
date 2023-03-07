class MigrateDescricaoToRichTextNotificacao < ActiveRecord::Migration[7.0]
  include ActionView::Helpers::TextHelper
  def change
    rename_column :notificacoes, :descricao, :descricao_old
    Notificacao.all.each do |notificacao|
      notificacao.update_attribute(:descricao, simple_format(notificacao.descricao_old))
    end
    remove_column :notificacoes, :descricao_old
  end
end
