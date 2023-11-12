# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Boards', type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:valid_board) { FactoryBot.attributes_for(:board) }
  let(:invalid_board) { FactoryBot.attributes_for(:board, name: '') }

  before(:each) do
    sign_in user
  end

  describe 'POST /boards' do
    context 'params are valid' do
      it 'should change Board count' do
        expect do
          post '/boards', params: { board: valid_board }
        end.to(change { Board.count }.by(1))
      end

      it 'should redirect to root path' do
        post '/boards', params: { board: valid_board }
        expect(response).to redirect_to(root_path)
      end
    end

    context 'params are invalid' do
      it 'should not change Board count' do
        expect do
          post '/boards', params: { board: invalid_board }
        end.not_to(change { Board.count })
      end

      it 'should render new template' do
        post '/boards', params: { board: invalid_board }
        expect(response).to render_template(:new)
      end
    end
  end
end
