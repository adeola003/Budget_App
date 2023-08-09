FactoryBot.define do
  factory :group do
    name { 'MyString' }
    icon { 'MyString' }
    association :user, factory: :user
  end
end
