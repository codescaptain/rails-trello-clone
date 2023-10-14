# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Boards', type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:board) { FactoryBot.create(:board) }
  before(:each) do
    sign_in user
  end
  describe 'GET#show' do
    it 'returns http success' do
      get board_path(board)
      expect(response).to have_http_status(:success)
    end
  end
end
