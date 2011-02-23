require "spec_helper"

describe UserNotification do
  describe "sell" do
    let(:mail) { UserNotification.sell }

    it "renders the headers" do
      mail.subject.should eq("Sell")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
