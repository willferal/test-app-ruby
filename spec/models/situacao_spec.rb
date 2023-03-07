require 'rails_helper'

RSpec.describe Situacao, type: :model do
  it 'is valid with params' do
    situacao = create(:situacao)
    expect(situacao).to be_valid
  end

  it 'is invalid params' do
    situacao = build(:situacao)
    situacao.descricao = "CA"
    expect(situacao).not_to be_valid
  end

  context 'Validates' do
    let!(:situacao) { create(:situacao) }

    it { is_expected.to validate_presence_of(:descricao) }
    it { is_expected.to validate_length_of(:descricao).is_at_least(3) }
    it { is_expected.to validate_length_of(:descricao).is_at_most(100) }
    it { should validate_uniqueness_of(:descricao).scoped_to(:deleted_at).case_insensitive }
  end
  
  context 'Associations' do
    it { is_expected.to have_many(:notificacoes).dependent(:restrict_with_error) }
  end
end
