# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Lists', type: :request do
  let(:user) { create(:user) }
  let(:valid_board) { create(:board) }
  let(:valid_list) { attributes_for(:list, board: valid_board) }

  before(:each) do
    sign_in user
  end

  describe 'POST /boards' do
    context 'params are valid' do
      it 'should change Board count' do
        expect do
          post board_lists_path(valid_board), params: { list: valid_list }
        end.to(change { List.count }.by(1))
      end

      it 'should redirect to root path' do
        post board_lists_path(valid_board), params: { list: valid_list }
        expect(response).to redirect_to(board_path(valid_board))
      end
    end

    context 'params are invalid' do
      it 'should not change List count' do
        expect do
          post board_lists_path(board_id: valid_board.id + 1), params: { list: valid_list }
        end.not_to(change { List.count })
      end
    end
  end
end
