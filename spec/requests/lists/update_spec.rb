require 'rails_helper'

RSpec.describe 'Lists', type: :request do
  let(:user) { create(:user) }
  let(:valid_board) { create(:board) }
  let(:valid_list) { create(:list, board: valid_board) }
  let(:valid_list_atrr) { attributes_for(:list, title: 'Yoda', board: valid_board) }

  before(:each) do
    sign_in user
  end

  describe 'GET#edit' do
    it 'returns http success' do
      patch board_list_path(board_id: valid_board.id, id: valid_list.id), params: { list: valid_list_atrr }
      expect(response).to have_http_status(302)
    end

    it "should return the user's board" do
      patch board_list_path(board_id: valid_board.id, id: valid_list.id), params: { list: valid_list_atrr }
      expect(assigns['list']).to eq(valid_list)
    end
  end
end
