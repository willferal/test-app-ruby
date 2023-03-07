class ServicoDetalhe < ApplicationRecord
  acts_as_paranoid

  attr_accessor :user_logged

  has_rich_text :descricao
  belongs_to :servico
  belongs_to :tipo_detalhe

  acts_as_list scope: 'servico_id = #{servico_id} AND deleted_at IS NULL', column: :posicao

  validates :titulo, :descricao, :servico_id, presence: true
  validates :titulo, uniqueness: { case_sensitive: false, scope: :servico_id }
end
