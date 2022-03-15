require 'rails_helper'

describe MonstersController, type: :feature do
  include Capybara::DSL

  before(:each) do
    create(:bandit)
  end

  describe "GET /index" do
    it 'renders the index page and lists the monsters' do
      visit '/monsters'
      expect(page).to have_selector('h1', text: 'Monsters')
      expect(page).to have_css('.card')
    end
  end
end
