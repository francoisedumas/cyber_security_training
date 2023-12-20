require "test_helper"

class LinkControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get links_url
    assert_response :success
  end

  test "should create a link" do
    post links_url, params: { link: { target: "javascript:alert('XSS Attack!')" } }

    assert_redirected_to links_path
  end
end
