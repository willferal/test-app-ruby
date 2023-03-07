class TipoEntidade < ApplicationRecord
  TIPO_JURIDICA = 'Jurídica'

  acts_as_paranoid

  has_many :entidades, dependent: :restrict_with_error

  before_validation :strip_whitespace

  validates :descricao, presence: true
  validates :descricao, uniqueness: { case_sensitive: false,  scope: :deleted_at }

  default_scope { order(:descricao) }

  def juridica?
   descricao == TipoEntidade::TIPO_JURIDICA
  end

  private

  def strip_whitespace
    self.descricao = descricao&.strip
  end
end
