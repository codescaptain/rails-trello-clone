require 'rails_helper'

RSpec.describe "Api::Lists", type: :request do
  let!(:board) { create(:board) }
  let!(:lists) { create_list(:list, 3, board: board) }
  describe "GET#index" do
    context 'user is not sign in' do
      it "returns http 204" do
        get api_board_lists_path(board)
        expect(response).to have_http_status(204)
      end
    end
  end
end
