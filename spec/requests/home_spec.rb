require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "GET root path" do
    it "returns http success" do
      get root_path
      expect(response.status).to eq(200)
    end
  end

end
