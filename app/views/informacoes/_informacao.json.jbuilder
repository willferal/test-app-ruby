json.extract! informacao, :id, :descricao, :titulo, :situacao_id, :deleted_at, :created_at, :updated_at
json.url informacao_url(informacao, format: :json)
