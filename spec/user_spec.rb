require "spec_helper"
describe Ogli::User do
  
  let :user_1 do
    user_1 = Ogli::User.new(:id=>1)
    user_1.client = mock_client
    user_1
  end
  
  let :mock_client do
    mock("client")
  end
  
  it "allow setting the client" do
    user = Ogli::User.new
    user.client = "client"
    user.client.should == "client"
  end
  
  it "have an activities attribute which fetches when called" do
    mock_client.should_receive(:get_and_map).with("/1/activities",Ogli::Activity).and_return("activities")
    user_1.activities.should == "activities"
  end
  
  it "only fetch activities once" do
    mock_client.should_receive(:get_and_map).once.with("/1/activities",Ogli::Activity).and_return([])
    user_1.activities
    user_1.activities
  end
  
end