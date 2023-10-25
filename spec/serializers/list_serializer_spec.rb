require 'rails_helper'

RSpec.describe ListSerializer, type: :serializer do
  let!(:board) { create(:board) }
  let!(:lists) { create_list(:list, 3, board: board) }
  let(:serializer) { ListSerializer.new(board.lists).serializable_hash.to_json }
  subject { JSON.parse(serializer).deep_symbolize_keys[:data] }

  it 'should include board_id' do
    expect(subject.first[:attributes][:board_id]).to eq(board.id)
  end

  it 'should include class_list' do
    expect(subject.first[:attributes][:class_list]).to eq(lists.first.class_list)
  end

  it 'should include title' do
    expect(subject.first[:attributes][:title]).to eq(lists.first.title)
  end
end
