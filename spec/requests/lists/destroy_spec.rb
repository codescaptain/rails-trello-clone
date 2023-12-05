require 'rails_helper'

RSpec.describe 'Lists', type: :request do
  let(:user) { create(:user) }
  let(:valid_board) { create(:board) }
  let(:valid_list) { create(:list, board: valid_board) }

  before(:each) do
    sign_in user
  end

  describe 'DELETE#destroy' do
    it 'returns http success' do
      delete "/boards/#{valid_board.id}/lists/#{valid_list.id}"
      expect(response).to have_http_status(302)
    end
  end
end
