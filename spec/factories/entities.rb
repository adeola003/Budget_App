FactoryBot.define do
  factory :entity do
    name { 'MyString' }
    amount { '9.99' }
    user { nil }
    group { nil }
  end
end
