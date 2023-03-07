json.extract! servico, :id, :tipo_servico_id, :entidade_id, :vigencia_inicial, :vigencia_final, :observacoes, :created_at, :updated_at
json.url servico_url(servico, format: :json)
