json.extract! notificacao, :id, :descricao, :vigencia, :data_hora, :assunto, :situacao_id, :deleted_at, :created_at, :updated_at
json.url notificacao_url(notificacao, format: :json)
