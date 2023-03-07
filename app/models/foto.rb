class Foto < ApplicationRecord
  acts_as_paranoid

  belongs_to :servico

  acts_as_list scope: 'servico_id = #{servico_id} AND deleted_at IS NULL', column: :posicao

  validates :nome_arquivo, :token, :servico_id, :titulo, presence: true
end
