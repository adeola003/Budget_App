require 'rails_helper'

RSpec.describe 'groups/index', type: :feature do
  let(:user) { create(:user) }
  let!(:groups) { create_list(:group, 3, user:) }

  before do
    sign_in user
    visit groups_path
  end

  it 'displays the group names' do
    expect(page).to have_text('MyString')
  end

  it 'displays edit and delete links for each group' do
    expect(page).to have_link('Edit', count: 3)
    expect(page).to have_selector('.delete-button', count: 3)
  end

  it 'displays a link to create a new group' do
    expect(page).to have_link('New Group')
  end

  it 'displays the correct icon for each group' do
    expect(page).to have_css('.icon', count: 3)
  end
end

RSpec.describe 'groups/show', type: :feature do
  before do
    @user = FactoryBot.create(:user)
    @group = FactoryBot.create(:group, user: @user)
    @entities = [
      FactoryBot.create(:entity, group: @group, user: @user, name: 'Entity 1', amount: 100),
      FactoryBot.create(:entity, group: @group, user: @user, name: 'Entity 2', amount: 200)
    ]
    sign_in @user
    visit group_path(@group)
  end

  it 'displays the group name' do
    expect(page).to have_selector('h1', text: @group.name)
  end

  it 'displays the entity details and delete button' do
    @entities.each do |entity|
      expect(page).to have_selector('.transaction-item', text: entity.name)
      expect(page).to have_selector('.transaction-item', text: "$#{entity.amount}")
      expect(page).to have_selector('.delete-button', text: 'Delete')
    end
  end

  it 'displays a link to add a new transaction' do
    expect(page).to have_link('Add a New Transaction', href: new_group_entity_path(@group))
  end

  it 'displays a link to go back to the groups list' do
    expect(page).to have_link('Back', href: groups_path)
  end
end
