FactoryBot.define do
  factory :situacao do
    descricao { Faker::Name.name }
  end
end
