require 'rails_helper'

RSpec.describe 'Lists', type: :request do
  let(:user) { create(:user) }
  let(:valid_board) { create(:board) }
  let(:valid_list) { create(:list, board: valid_board) }

  before(:each) do
    sign_in user
  end

  describe 'GET#edit' do
    it 'returns http success' do
      get "/boards/#{valid_board.id}/lists/#{valid_list.id}/edit"
      expect(response).to have_http_status(:success)
    end

    it "should return the user's board" do
      get "/boards/#{valid_board.id}/lists/#{valid_list.id}/edit"
      expect(assigns['list']).to eq(valid_list)
    end
  end
end
