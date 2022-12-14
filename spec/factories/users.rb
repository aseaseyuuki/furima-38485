FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.unique.email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    encrypted_password    { password }
    family_name           { '山田' }
    family_name_kana      { 'ヤマダ' }
    first_name            { '太郎' }
    first_name_kana       { 'タロウ' }
    birth_day             { '2000-01-01' }
  end
end
