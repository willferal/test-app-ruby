class Entidade < ApplicationRecord
  acts_as_paranoid

  belongs_to :municipio, required: false
  belongs_to :tipo_entidade, required: false
  belongs_to :origem, required: false
  has_many :entidade_atuacoes
  has_many :atuacoes, through: :entidade_atuacoes
  
  validates :nome, presence: true
  validates :tipo_entidade_id, presence: true
  validates :nome, presence: true
  validates :razao_social, presence: true, if: :juridica?
  validates :origem_id, presence: true
  validates :cpf_cnpj, presence: true
  validates :cpf_cnpj, uniqueness: { case_sensitive: false,  scope: :deleted_at }
  validate :tem_atuacoes
  validate :cpf_cnpj_valido, if: -> { cpf_cnpj.present? }

  has_many :servicos, dependent: :restrict_with_error

  private

  def tem_atuacoes
    return if atuacoes.present?

    errors.add(:atuacao_ids, message: :blank)
  end

  def cpf_cnpj_valido
    return if juridica? and CNPJ.valid?(cpf_cnpj)
    return if CPF.valid?(cpf_cnpj)

    errors.add(:cpf_cnpj, message: :invalid)
  end

  def juridica?
    tipo_entidade&.juridica?
  end
end
