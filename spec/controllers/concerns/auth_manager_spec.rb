describe AuthManager do

  class FakeController < ApplicationController
    include AuthManager
  end

  describe "check_authentication!" do

    let :controller { FakeController.new }

    it "should raise http exception if Autherization header is missing" do
      allow(controller).to receive(:authorization_header).and_return(nil)
      
      expect { controller.check_authentication! }.to raise_error(Api::V1::Exceptions::HttpException)
    end

    it "should not raise http exception if Autherization header is present" do
      # TODO REMOVE LATER
      allow(controller).to receive(:authorization_header).and_return("")
      
      expect { controller.check_authentication! }.not_to raise_error
    end
  end
end