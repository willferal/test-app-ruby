class Servico < ApplicationRecord
  acts_as_paranoid

  belongs_to :tipo_servico, required: false
  belongs_to :entidade, required: false
  belongs_to :user

  has_many :servico_detalhes, dependent: :destroy

  has_many :fotos, dependent: :destroy

  validates :tipo_servico_id, presence: true
  validates :entidade_id, presence: true
  validate :vigencias_preenchidas
  validate :vigencia_final_maior_que_inicial, if: :ambas_vigencias_preenchidas?

  scope :situacao_eq, lambda { |situacao|
    return Servico.nao_vigente if situacao == 'NÃO VIGENTE'
    return Servico.vigente if situacao == 'VIGENTE'
    return Servico.expirado if situacao == 'EXPIRADO'

    Servico.none
  }

  scope :nao_vigente, -> { where('current_date < vigencia_inicial OR vigencia_inicial IS NULL') }
  scope :vigente, -> { where('current_date >= vigencia_inicial AND current_date <= vigencia_final') }
  scope :expirado, -> { where('current_date > vigencia_final') }

  SITUACOES = [
    'NÃO VIGENTE',
    'VIGENTE',
    'EXPIRADO'
  ]

  def situacao
    return 'NÃO VIGENTE' if vigencia_inicial.nil? or Date.today < vigencia_inicial
    return 'VIGENTE' if Date.today.between?(vigencia_inicial, vigencia_final)
     
    'EXPIRADO'
  end

  def self.ransackable_scopes(_auth_object = nil)
    [:situacao_eq]
  end

  def aprovar_texto!(current_user)
    update({ texto_aprovado: true }) if check_user(current_user)
  end

  def desaprovar_texto!(current_user)
    update({ texto_aprovado: false }) if check_user(current_user)
  end

  private

    def vigencias_preenchidas
      return if ambas_vigencias_preenchidas?
      return if nenhum_vigencia_preenchida?

      errors.add(' ', 'Ambas ou nenhum das vigências devem ser preenchidas.')
    end

    def vigencia_final_maior_que_inicial
      return if vigencia_inicial <= vigencia_final

      errors.add(:vigencia_final, message: :not_less_than, field: 'Vigência Inicial')
    end

    def ambas_vigencias_preenchidas?
      [vigencia_inicial, vigencia_final].all?(&:present?)
    end

    def nenhum_vigencia_preenchida?
      [vigencia_inicial, vigencia_final].all?(&:nil?)
    end

    def check_user(current_user)
      return true if user_id != current_user.id

      errors.add(:base, I18n.t('errors.messages.approve_or_reprove'))
      false
    end
end
