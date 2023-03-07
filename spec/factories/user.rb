FactoryBot.define do
  factory :user do
    nome { Faker::Name.name }
    cpf { Faker::Number.number(digits: 11) }
    login { Faker::Internet.username(specifier: 5)  }
    email { Faker::Internet.unique.email }
    password {'metro12345'}
    password_confirmation {'metro12345'}

    # after(:build)   { |u| u.skip_confirmation_notification! }
    after(:create)  { |u| u.confirm }
  end
end
