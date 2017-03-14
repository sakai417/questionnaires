require 'test_helper'

class ConpaniesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get conpanies_index_url
    assert_response :success
  end

end
