FactoryBot.define do
  factory :user do
    name { 'MyString' }
    email { 'test@email.com' }
    password { 'password123' }
  end
end
