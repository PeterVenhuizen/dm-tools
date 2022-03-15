require 'rails_helper'

describe MonstersController, type: :feature do
  include Capybara::DSL

  describe "GET /index" do
    before { visit '/monsters' }

    it 'renders the index page' do
      # visit '/monsters'
      puts page
      expect(page).to have_selector('h1', text: 'Monsters')
      expect(page).to have('.card', count: 3)
    end
  end
end
