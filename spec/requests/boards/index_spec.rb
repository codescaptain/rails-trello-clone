# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Boards', type: :request do
  let(:user) { FactoryBot.create(:user) }
  before(:each) do
    sign_in user
  end
  describe 'GET /new' do
    it 'returns http success' do
      get '/boards/new'
      expect(response).to have_http_status(:success)
    end
  end
end
