# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/monsters', type: :request do
  let(:valid_attributes) { attributes_for(:bandit) }
  let(:invalid_attributes) { attributes_for(:bandit, name: nil) }

  describe 'GET /index' do
    it 'renders a successful response' do
      Monster.create! valid_attributes
      get monsters_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      monster = Monster.create! valid_attributes
      get monster_url(monster)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_monster_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'render a successful response' do
      monster = Monster.create! valid_attributes
      get edit_monster_url(monster)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Monster' do
        expect do
          post monsters_url, params: { monster: valid_attributes }
        end.to change(Monster, :count).by(1)
      end

      it 'redirects to the created monster' do
        post monsters_url, params: { monster: valid_attributes }
        expect(response).to redirect_to(monster_url(Monster.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Monster' do
        expect do
          post monsters_url, params: { monster: invalid_attributes }
        end.to change(Monster, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post monsters_url, params: { monster: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested monster' do
        monster = Monster.create! valid_attributes
        patch monster_url(monster), params: { monster: new_attributes }
        monster.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the monster' do
        monster = Monster.create! valid_attributes
        patch monster_url(monster), params: { monster: new_attributes }
        monster.reload
        expect(response).to redirect_to(monster_url(monster))
      end
    end

    context 'with invalid parameters' do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        monster = Monster.create! valid_attributes
        patch monster_url(monster), params: { monster: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested monster' do
      monster = Monster.create! valid_attributes
      expect do
        delete monster_url(monster)
      end.to change(Monster, :count).by(-1)
    end

    it 'redirects to the monsters list' do
      monster = Monster.create! valid_attributes
      delete monster_url(monster)
      expect(response).to redirect_to(monsters_url)
    end
  end
end
