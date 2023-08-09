require 'rails_helper'

RSpec.describe "GroupsController", type: :request do
  include Devise::Test::IntegrationHelpers
  describe "GET #index" do
    context "when user is signed in" do
      let(:user) { create(:user) }

      before do
        sign_in user
        create_list(:group, 3, user: user)
        get groups_path
      end

      it "returns a successful response" do
        expect(response).to be_successful
      end

      it "renders the index template" do
        expect(response).to render_template(:index)
      end

      it "displays the user's groups" do
        expect(assigns(:groups)).to eq(user.groups)
      end
    end

    context "when user is not signed in" do
      it "redirects to sign in page" do
        get groups_path
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "GET #show" do
  let(:user) { create(:user) }
  let(:group) { create(:group, user: user) }

    context "when user is signed in" do
      before do
        sign_in user
        create_list(:entity, 3, group: group)
        get group_path(group)
      end
    end

    context "when user is not signed in" do
      it "redirects to sign in page" do
        get group_path(group)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
