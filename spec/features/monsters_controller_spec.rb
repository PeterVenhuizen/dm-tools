# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MonstersController, type: :feature do
  before do
    create(:bandit)
  end

  describe 'GET /index' do
    it 'renders the index page and lists the monsters' do
      visit monsters_path
      expect(page).to have_selector('h1', text: 'Monsters')
      expect(page).to have_css('.summary-row', count: 1)
    end
  end

  describe 'GET /show' do
    it 'renders the show page with a monster card' do
      bandit = Monster.first
      visit monster_url(bandit)
      expect(page).to have_css('.stat-block')
      expect(page).to have_content(/Bandit/i)
      expect(page).to have_link(nil, href: edit_monster_path(bandit))
      expect(page).to have_link(nil, href: monsters_path)
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      visit new_monster_url
      expect(page).to have_css('h1', text: 'New Monster')
    end
  end

  describe 'GET /edit' do
    it 'renders the edit page' do
      bandit = Monster.first
      visit edit_monster_path(bandit)
      expect(page).to have_css('h1', text: "Edit #{bandit.name}")
    end
  end
end
