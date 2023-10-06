require 'rails_helper'

RSpec.describe BoardPolicy, type: :policy do
  let(:user) { FactoryBot.create(:user) }
  let(:board) { FactoryBot.create(:board, user: user) }

  subject { described_class }

  it 'grants access if user owns the board' do
    expect(subject.new(user, board).edit?).to be true
  end

  it 'denies access if user does not own the board' do
    other_user = FactoryBot.create(:user)
    expect(subject.new(other_user, board).edit?).to be false
  end
end
