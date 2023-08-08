require 'rails_helper'

RSpec.describe Entity, type: :model do
  describe "validations" do
    it "is not valid without a name" do
      entity = build(:entity, name: nil)
      expect(entity).not_to be_valid
    end

    it "is not valid without an amount" do
      entity = build(:entity, amount: nil)
      expect(entity).not_to be_valid
    end

    it "is not valid with a negative amount" do
      entity = build(:entity, amount: -10)
      expect(entity).not_to be_valid
    end

    it "is not valid with amount of 0" do
      entity = build(:entity, amount: 0)
      expect(entity).not_to be_valid
    end
  end

  describe "initialization" do
    it "does not change amount if provided" do
      entity = build(:entity, amount: 5)
      expect(entity.amount).to eq(5)
    end
  end

  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:group) }
  end
end
