require 'rails_helper'

RSpec.describe 'Boards', type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:board) { FactoryBot.create(:board, user: user) }

  describe 'PUT#Update' do

    context 'with valid params' do
      let(:valid_board) { FactoryBot.attributes_for(:board) }

      subject { put "/boards/#{board.id}", params: { board: valid_board } }

      before(:each) do
        sign_in user
        subject
      end

      it 'should update the board' do
        expect(board.name).to eq(valid_board[:name])
      end

      it 'should redirect to root path' do
        expect(response).to redirect_to(root_path)
      end

      it 'should return 302 HTTP status code' do
        expect(response.status).to eq(302)
      end
    end

    context 'with invalid params' do
      let(:invalid_board) { FactoryBot.attributes_for(:board, name: '') }
      subject { put "/boards/#{board.id}", params: { board: invalid_board } }

      before(:each) do
        sign_in user
        subject
      end

      it 'should not update the board' do
        expect(board.name).not_to eq(invalid_board[:name])
      end

      it 'should render new template' do
        expect(response).to render_template(:edit)
      end
    end
  end
end
