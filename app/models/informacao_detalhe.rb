class InformacaoDetalhe < ApplicationRecord
  acts_as_paranoid

  has_rich_text :descricao
  acts_as_list scope: 'informacao_id = #{informacao_id} AND deleted_at IS NULL', column: :posicao

  belongs_to :informacao

  validates :titulo, :descricao, :informacao_id, presence: true
  validates :titulo, uniqueness: { case_sensitive: false,  scope: :deleted_at }
end
