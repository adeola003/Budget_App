require 'rails_helper'

RSpec.describe "EntitiesController", type: :request do
  include Devise::Test::IntegrationHelpers

  describe "GET #index" do
    context "when user is signed in" do
      let(:user) { create(:user) }
      let(:group) { create(:group, user: user) }

      before do
        sign_in user
        create_list(:entity, 3, group: group, user: user) # Make sure to associate the user with entities
        get group_entities_path(group)
      end

      it "returns a successful response" do
        expect(response).to be_successful
      end

      it "renders the index template" do
        expect(response).to render_template(:index)
      end

      it "displays the entities of the group" do
        expect(assigns(:entities)).to eq(group.entities.order(created_at: :desc))
      end

      it "calculates the total amount of entities" do
        total_amount = group.entities.sum(:amount)
        expect(assigns(:total_amount)).to eq(total_amount)
      end
    end
  end
end
