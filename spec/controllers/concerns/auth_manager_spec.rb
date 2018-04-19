describe AuthManager do

  class FakeController < ApplicationController
    include AuthManager
  end

  describe "check_authentication!" do

    let :controller { FakeController.new }
    let :user { create(:user) } 
    let :valid_token { controller.create_token(user) }

    it "should raise http exception if Autherization header is missing" do
      allow(controller).to receive(:authorization_header).and_return(nil)
      
      expect { controller.check_authentication! }.to raise_error(Api::V1::Exceptions::HttpException)
    end

    it "should raise http exception token is invalid" do
      allow(controller).to receive(:authorization_header).and_return("invalid token")
      
      expect { controller.check_authentication! }.to raise_error(Api::V1::Exceptions::HttpException)
    end

    it "should authenticate user if token is valid" do
      allow(controller).to receive(:authorization_header).and_return("DUM " + valid_token)
      
      controller.check_authentication!
      
      expect(controller.current_user).not_to be_nil
      expect(controller.current_user.id).to be_equal user.id
    end
  end
end