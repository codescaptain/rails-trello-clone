require 'rails_helper'

RSpec.describe 'Boards', type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:user2) { FactoryBot.create(:user) }
  let(:board) { FactoryBot.create(:board, user: user) }

  describe 'GET#edit' do
    context 'valid request' do
      before(:each) do
        sign_in user
      end
      it 'returns http success' do
        get "/boards/#{board.id}/edit"
        expect(response).to have_http_status(:success)
      end

      it "should return the user's board" do
        get "/boards/#{board.id}/edit"
        expect(assigns['board']).to eq(board)
      end
    end

    context 'invalid request' do
      before(:each) do
        sign_in user2
      end

      it "does not authorize the user" do
        expect do
          get "/boards/#{board.id}/edit"
        end.to raise_error(Pundit::NotAuthorizedError)
      end

    end
  end

end
