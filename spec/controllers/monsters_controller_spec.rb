require 'rails_helper'

RSpec.describe MonstersController, type: :feature do

  describe "GET /index" do
    it 'renders the index page and lists the monsters' do
      visit monsters_path
      expect(page).to have_selector('h1', text: 'Monsters')
      expect(page).to have_css('.box')
    end
  end

  describe "SHOW" do
    scenario 'renders the show page with a monster card' do
      bandit = create(:bandit)
      visit monster_url(bandit)
      expect(page).to have_css('.card')
      expect(page).to have_content(/Bandit/i)
      expect(page).to have_link(nil, href: edit_monster_path(bandit))
      expect(page).to have_link(nil, href: monsters_path)
    end
  end
end
