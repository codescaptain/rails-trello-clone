require 'rails_helper'

RSpec.describe "Api::Lists", type: :request do
  let!(:board) { create(:board) }
  let!(:lists) { create_list(:list, 3, board: board) }
  describe "GET#index" do
    it "returns http success" do
      get api_board_lists_path(board)
      expect(response).to have_http_status(:success)
    end
    it "should return the board's lists" do
      get api_board_lists_path(board)
      expect(json_data.size).to eq(3)
    end
  end
end
