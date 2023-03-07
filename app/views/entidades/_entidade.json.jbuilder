json.extract! entidade, :id, :nome, :cpf_cnpj, :razao_social, :endereco, :numero_endereco, :complemento_endereco, :bairro_endereco, :municipio_id, :tipo_entidade_id, :origem_id, :created_at, :updated_at
json.url entidade_url(entidade, format: :json)
