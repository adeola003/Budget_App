require 'rails_helper'

RSpec.describe Group, type: :model do
  describe "validations" do
    it "is not valid without a name" do
      group = build(:group, name: nil)
      expect(group).not_to be_valid
    end
  end

  describe "associations" do
    it { should belong_to(:user) }
    it { should have_many(:entities).dependent(:destroy) }
  end

  describe "before_save" do
    it "sets default icon if not provided" do
      user_instance = create(:user)
      group = create(:group, user: user_instance, icon: nil)
      expect(group.icon).to eq('https://source.unsplash.com/ocAo7MwGfHY')
    end

    it "does not change icon if provided" do
      user_instance = create(:user)
      group = create(:group, user: user_instance, icon: 'custom_icon_url')
      expect(group.icon).to eq('custom_icon_url')
    end
  end
end
