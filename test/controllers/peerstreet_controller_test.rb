require 'test_helper'

class PeerstreetControllerTest < ActionDispatch::IntegrationTest
  test "should get zip" do
    get peerstreet_zip_url
    assert_response :success
  end

end
