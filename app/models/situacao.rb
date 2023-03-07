class Situacao < ApplicationRecord
  acts_as_paranoid

  has_many :notificacoes, dependent: :restrict_with_error

  before_validation :strip_whitespace

  validates :descricao, presence: true
  validates :descricao, uniqueness: { case_sensitive: false,  scope: :deleted_at }
  validates :descricao, length: { minimum: 3, maximum: 100 }, if: -> { descricao.present? }

  def strip_whitespace
    self.descricao = descricao&.strip
  end
end
