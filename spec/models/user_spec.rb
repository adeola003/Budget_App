require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'is not valid without a name' do
      user = build(:user, name: nil)
      expect(user).not_to be_valid
    end

    it 'is valid with valid attributes' do
      user = build(:user)
      expect(user).to be_valid
    end
  end

  describe 'associations' do
    it { should have_many(:groups).dependent(:destroy) }
    it { should have_many(:entities).through(:groups) }
  end

  describe 'Devise modules' do
    it 'includes :database_authenticatable module' do
      expect(User.devise_modules).to include(:database_authenticatable)
    end

    it 'includes :registerable module' do
      expect(User.devise_modules).to include(:registerable)
    end

    it 'includes :recoverable module' do
      expect(User.devise_modules).to include(:recoverable)
    end

    it 'includes :rememberable module' do
      expect(User.devise_modules).to include(:rememberable)
    end

    it 'includes :validatable module' do
      expect(User.devise_modules).to include(:validatable)
    end
  end
end
