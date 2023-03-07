class ModuloDetalhe < ApplicationRecord
  acts_as_paranoid

  belongs_to :modulo

  acts_as_list scope: 'modulo_id = #{modulo_id} AND deleted_at IS NULL', column: :posicao

  has_rich_text :descricao
  validates :titulo, :descricao, :modulo_id, presence: true
  validates :titulo, uniqueness: { case_sensitive: false, scope: :modulo_id }
end
