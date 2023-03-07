class EntidadeAtuacao < ApplicationRecord
  belongs_to :entidade
  belongs_to :atuacao
end
