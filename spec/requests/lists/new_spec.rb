require 'rails_helper'

RSpec.describe 'Lists', type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:board) { FactoryBot.create(:board, user: user) }

  describe 'GET#new' do
    before(:each) do
      sign_in user
    end

    context 'the board_id exists' do
      it 'returns http success' do
        get new_board_list_path(board)
        expect(response.status).to eq(200)
      end
    end

    context 'the board_id does not exist' do
      it 'returns http success' do
        get new_board_list_path(board_id: 999)
        expect(response.status).to eq(404)
      end
    end
  end
end
