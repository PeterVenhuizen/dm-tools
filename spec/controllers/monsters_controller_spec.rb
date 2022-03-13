require 'rails_helper'

describe MonstersController do
  include Capybara::DSL

  describe "GET /index" do
    before { visit monsters_path }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the index page' do
      expect(page).to have_selector('h1', text: 'Monsters')
    end
  end
end
