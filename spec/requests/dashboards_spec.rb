require 'rails_helper'

RSpec.describe 'Dashboards', type: :request do

  let(:user) { FactoryBot.create(:user) }
  before(:each) do
    sign_in user
  end

  describe 'GET /index' do
    let!(:boards) { FactoryBot.create_list(:board, 5) }

    it 'returns http success' do
      get "/dashboards"
      expect(response).to have_http_status(:success)
    end

    it 'should return all boards' do
      get '/dashboards'
      expect(assigns['boards'].pluck(:id)).to eq(boards.pluck(:id))
    end
  end

end
