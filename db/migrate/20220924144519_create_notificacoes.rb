class CreateNotificacoes < ActiveRecord::Migration[7.0]
  def change
    create_table :notificacoes do |t|
      t.string :descricao, null: false
      t.integer :vigencia, null: false, limit: 3
      t.datetime :data_hora, null: false
      t.string :assunto, null: false
      t.references :situacao, null: false, foreign_key: true
      t.string :state, null: false
      t.timestamps
      t.datetime :deleted_at
    end
  end
end
