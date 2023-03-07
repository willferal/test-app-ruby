class Municipio < ApplicationRecord
  belongs_to :uf

  validates :descricao, presence: true
  validates :uf_id, presence: true

  scope :only_from, lambda { |sigla_uf|
    joins(:uf).where(uf: {sigla: sigla_uf})
  }

  default_scope { order(:descricao) }
end
