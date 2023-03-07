class Modulo < ApplicationRecord
  acts_as_paranoid

  has_many :modulo_detalhes, dependent: :restrict_with_error
  belongs_to :autor, class_name: 'User', required: false

  acts_as_list scope: 'deleted_at IS NULL', column: :posicao

  validates_presence_of :titulo, :descricao, :icone, :url
  validates_uniqueness_of :titulo

  scope :active, -> { where(ativo: true) }
  default_scope { order(:posicao) }

  def aprovar_texto!(current_user)
    if autor_id == current_user.id
      errors.add(' ', I18n.t('errors.messages.approve_or_reprove'))
      return false
    end

    update({ texto_aprovado: true })
  end

  def desaprovar_texto!(current_user)
    if autor_id == current_user.id
      errors.add(' ', I18n.t('errors.messages.approve_or_reprove'))
      return false
    end

    update({ texto_aprovado: false })
  end
end
