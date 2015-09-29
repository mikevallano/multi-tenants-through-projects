require 'rails_helper'

RSpec.describe "Memberinvites", type: :request do
  describe "GET /memberinvites" do
    it "works! (now write some real specs)" do
      get memberinvites_path
      expect(response).to have_http_status(200)
    end
  end
end
