require "spec_helper"

Capybara.javascript_driver = :webkit
Capybara.current_driver = :webkit

describe 'Articles feature', type: :feature, js: true do
  describe 'admin interface' do
    it 'can be configured via the Patient Type options' do
      visit "erxtwo/articles"
      find("h1", text: 'Listing Articles')
      # find("a#new-article").click
      # find("h1", "Bazoo")
    end
  end
end
