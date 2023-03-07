class Uf < ApplicationRecord
  has_many :municipios

  validates :sigla, presence: true
  validates :descricao, presence: true

  default_scope { order(:descricao) }
end
