require 'rails_helper'

RSpec.describe BoardPolicy, type: :policy do
  let(:user) { FactoryBot.create(:user) }
  let(:board) { FactoryBot.create(:board, user: user) }

  subject { described_class }

  permissions :update?, :edit? do
    it "denies access if the user does not own the board" do
      other_user = FactoryBot.create(:user)
      expect(subject).not_to permit(other_user, board)
    end

    it "accepts access if the user owns the board" do
      expect(subject).to permit(user, board)
    end
  end
end
