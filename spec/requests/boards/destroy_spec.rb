require 'rails_helper'

RSpec.describe 'Boards', type: :request do
  let(:user) { FactoryBot.create(:user) }
  let!(:board) { FactoryBot.create(:board, user: user) }

  describe 'DESTROY#edit' do
    before(:each) do
      sign_in user
    end

    context 'with valid params' do
      it 'should decrease board by 1' do
        expect do
          delete "/boards/#{board.id}"
        end.to(change { Board.count }.by(-1))
      end

      it 'returns http 302' do
        delete "/boards/#{board.id}"
        expect(response).to have_http_status(302)
      end
    end

    context 'with invalid params' do
      it 'should return 404 status' do
        delete "/boards/#{board.id + 1}"
        expect(response).to have_http_status(404)
      end
    end
  end
end
