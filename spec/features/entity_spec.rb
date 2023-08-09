require 'rails_helper'

RSpec.describe 'entities/show', type: :feature do
  before do
    @user = FactoryBot.create(:user)
    @group = FactoryBot.create(:group, user: @user)
    @entity = FactoryBot.create(:entity, group: @group, user: @user, name: 'Entity Name', amount: 300)
    sign_in @user
    visit group_entity_path(@group, @entity)
  end

  it 'displays the entity name' do
    expect(page).to have_selector('h1', text: @entity.name)
  end

  it 'displays the entity amount' do
    expect(page).to have_selector('p', text: "$300")
  end

  it 'displays the creation date of the entity' do
    expect(page).to have_selector('p', text: @entity.created_at.strftime('%B %d, %Y'))
  end

  it 'displays a link to edit the entity' do
    expect(page).to have_link('Edit', href: edit_group_entity_path(@group, @entity))
  end

  it 'displays a link to go back to the group' do
    expect(page).to have_link('Back', href: group_path(@group))
  end
end
