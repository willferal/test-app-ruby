class AddUserToNotificacao < ActiveRecord::Migration[7.0]
  def change
    add_reference :notificacoes, :user, foreign_key: true
  end
end
