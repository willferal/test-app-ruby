class Notificacao < ApplicationRecord
  include AASM

  acts_as_paranoid

  attr_accessor :user_logged

  has_rich_text :descricao
  belongs_to :situacao, required: false
  belongs_to :user

  validates :descricao, :assunto, :vigencia, presence: true
  validates_presence_of :user, on: :create
  validates :vigencia, numericality: { greater_than: 0, less_than: 73 }, if: -> { vigencia.present? }
  validates :vigencia, length: { minimum: 1, maximum: 2 }, if: -> { vigencia.present? }

  default_scope { order(:id) }

  aasm column: :state, whiny_transitions: false do
    state :cadastrado, initial: true, after_enter: :initial_situacao_id
    state :aprovado
    state :inativado

    event :aprovar, after: :update_situacao_id do
      transitions from: :cadastrado, to: :aprovado, guard: :other_user?
    end

    event :inativar, after: :update_situacao_id do
      transitions from: :aprovado, to: :inativado, guard: :other_user?
    end
  end

  def vigente?
    return false unless data_hora

    DateTime.current < (data_hora + vigencia.days)
  end

  def initial_situacao_id
    self.situacao_id = Situacao.find_by(descricao: aasm.current_state.upcase).id
  end

  def update_situacao_id
    self.update(situacao_id: Situacao.find_by(descricao: aasm.current_state.upcase).id)
  end

  def other_user?
    return true unless user_id == user_logged.id

    errors.add(' ', I18n.t('errors.messages.approve_or_reprove'))
    false
  end
end
