require 'test_helper'

class FeedTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers

    def setup
        sign_in users(:eric)
    end

    test "see feed if logged in" do
        get "/" 
        assert_select "h2", "feed:"
    end

    test "see log in page if not logged in" do
        sign_out :user
        get "/posts"
        follow_redirect!
        assert_select "p", "You need to sign in or sign up before continuing."
    end
end
