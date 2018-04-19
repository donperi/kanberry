require 'rails_helper'

RSpec.describe Api::V1::SessionController, type: :request do

  describe "#login" do
    let (:user) { create(:user) }

    it "should return token with valid credentials" do
      post '/api/v1/session/login', params: { email: user.email, password: 'default' }

      expect(response).to have_http_status(200)
    end

    it "should return status 402 with wrong credentials" do
      post '/api/v1/session/login', params: { email: user.email, password: 'HACKER' }

      expect(response).to have_http_status(402)
    end
  end

end
