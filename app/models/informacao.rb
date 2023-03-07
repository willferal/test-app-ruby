class Informacao < ApplicationRecord
  include AASM

  acts_as_paranoid

  belongs_to :situacao
  belongs_to :autor, class_name: 'User', required: false

  has_many :informacao_detalhes, dependent: :restrict_with_error

  has_rich_text :descricao
  acts_as_list scope: 'deleted_at IS NULL', column: :posicao

  validates :titulo, :descricao, presence: true
  validates :titulo, uniqueness: { case_sensitive: false, scope: :deleted_at }

  default_scope { order(:posicao) }

  aasm column: :state do
    state :cadastrado, initial: true, after_enter: :initial_situacao_id
    state :aprovado
    state :desaprovado
    state :inativado

    event :aprovar, after: :update_situacao_id do
      transitions from: :cadastrado, to: :aprovado
      transitions from: :desaprovado, to: :aprovado
    end

    event :desaprovar, after: :update_situacao_id do
      transitions from: :aprovado, to: :desaprovado
      transitions from: :cadastrado, to: :desaprovado
    end

    event :inativar, after: :update_situacao_id do
      transitions from: :cadastrado, to: :inativado
      transitions from: :aprovado, to: :inativado
      transitions from: :desaprovado, to: :inativado
    end
  end

  def initial_situacao_id
    self.situacao_id = Situacao.find_by(descricao: aasm.current_state.upcase).id
  end

  def update_situacao_id
    update(situacao_id: Situacao.find_by(descricao: aasm.current_state.upcase).id)
  end
end
