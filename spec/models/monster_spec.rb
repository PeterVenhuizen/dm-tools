require 'rails_helper'

RSpec.describe Monster, type: :model do
  it 'is valid' do
    bandit = build(:bandit)
    expect(bandit).to be_valid
  end

  it 'has a name at least 2 characters long' do
    bandit = build(:bandit, name: '')
    expect(bandit).not_to be_valid
    expect(bandit.errors.messages[:name]).not_to be_empty
  end

  it 'has a default challenge rating of zero' do
    monster = Monster.new
    expect(monster.challenge_rating).to eq '0'
  end

  describe 'challenge_rating' do
    it 'is positive' do
      bandit = build(:bandit, challenge_rating: -1)
      expect(bandit).not_to be_valid
    end

    it 'is not bigger than 30' do
      bandit = build(:bandit, challenge_rating: 31)
      expect(bandit).not_to be_valid
    end
  end

  describe 'xp' do
    it 'is numeric' do
      bandit = build(:bandit, xp: 'abc')
      expect(bandit).not_to be_valid
    end

    it 'is positive' do
      bandit = build(:bandit, xp: -31)
      expect(bandit).not_to be_valid
    end
  end

  describe 'size' do
    it 'must have a size' do
      bandit = build(:bandit, size: nil)
      expect(bandit).not_to be_valid
    end

    it 'can be Tiny, Small, Medium, Large, Huge, Gargantuan' do
      sizes = %w[Tiny Small Medium Large Huge Gargantuan]
      sizes.each do |size|
        bandit = build(:bandit, size: size)
        expect(bandit).to be_valid
      end
    end

    it 'cannot be a Giant' do
      giant_bandit = build(:bandit, size: 'Giant')
      expect(giant_bandit).not_to be_valid
    end
  end
end
