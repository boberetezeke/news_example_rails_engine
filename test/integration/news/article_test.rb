require 'test_helper'

class ArticleTest < ActionDispatch::IntegrationTest
  test "the truth" do
    get "/news/articles"
    assert_select "h1", "Listing Articles"
  end
end
