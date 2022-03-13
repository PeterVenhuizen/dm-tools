require 'rails_helper'

RSpec.describe Monster, type: :model do
  it 'is valid' do
    bandit = build(:bandit)
    expect(bandit).to be_valid
  end

  it 'has a name at least 2 characters long' do
    invalid_bandit = build(:bandit, name: '')
    expect(invalid_bandit).not_to be_valid
  end

  it 'has a default challenge rating of zero' do
    monster = described_class.new
    expect(monster.challenge_rating).to eq '0'
  end

  describe 'challenge_rating' do
    it 'is positive' do
      invalid_bandit = build(:bandit, challenge_rating: -1)
      expect(invalid_bandit).not_to be_valid
    end

    it 'is not bigger than 30' do
      invalid_bandit = build(:bandit, challenge_rating: 31)
      expect(invalid_bandit).not_to be_valid
    end
  end

  describe 'xp' do
    it 'is numeric' do
      invalid_bandit = build(:bandit, xp: 'abc')
      expect(invalid_bandit).not_to be_valid
    end

    it 'is positive' do
      invalid_bandit = build(:bandit, xp: -31)
      expect(invalid_bandit).not_to be_valid
    end
  end

  describe 'size' do
    it 'must have a size' do
      invalid_bandit = build(:bandit, size: nil)
      expect(invalid_bandit).not_to be_valid
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

  describe 'species' do
    it 'must have one' do
      invalid_bandit = build(:bandit, species: nil)
      expect(invalid_bandit).not_to be_valid
    end

    it 'has a fixed selection' do
      species = %w[Aberration Beast Celestial Construct Dragon Elemental Fey Fiend Giant Humanoid Monstrosity Ooze Plant Undead]
      species.each do |s|
        bandit = build(:bandit, species: s)
        expect(bandit).to be_valid
      end
    end

    it 'cannot be a Zombie' do
      zombie_bandit = build(:bandit, species: 'Zombie')
      expect(zombie_bandit).not_to be_valid
    end
  end

  it 'has an armor_class' do
    invalid_bandit = build(:bandit, armor_class: nil)
    expect(invalid_bandit).not_to be_valid
  end

  describe 'hit_points' do
    it 'must have hit points' do
      invalid_bandit = build(:bandit, hit_points: nil)
      expect(invalid_bandit).not_to be_valid
    end

    it 'must be numeric' do
      invalid_bandit = build(:bandit, hit_points: 'thirty-one')
      expect(invalid_bandit).not_to be_valid
    end

    it 'must be bigger than zero' do
      invalid_bandit = build(:bandit, hit_points: -31)
      expect(invalid_bandit).not_to be_valid
    end
  end

  describe 'hit_dice' do
    it 'must have them' do
      invalid_bandit = build(:bandit, hit_dice: nil)
      expect(invalid_bandit).not_to be_valid
    end

    it 'can only contain d4, d6, d8, d10, d12, or d20' do
      invalid_hit_dice = %w[1d2 1d3 1d7 1d13 1d17]
      invalid_hit_dice.each do |hit_dice|
        invalid_bandit = build(:bandit, hit_dice: hit_dice)
        expect(invalid_bandit).not_to be_valid
      end
    end

    it 'must be a valid format of xdy' do
      valid_hit_dice = %w[1d4 3d12 10d8 8d4 3d20]
      valid_hit_dice.each do |hit_dice|
        bandit = build(:bandit, hit_dice: hit_dice)
        expect(bandit).to be_valid
      end
    end

    it 'can have modifier in addition to the dice' do
      valid_hit_dice = ['1d4 - 1', '6d10 + 12']
      valid_hit_dice.each do |hit_dice|
        bandit = build(:bandit, hit_dice: hit_dice)
        expect(bandit).to be_valid
      end
    end
  end

  it 'has an alignment' do
    invalid_bandit = build(:bandit, alignment: nil)
    expect(invalid_bandit).not_to be_valid
  end

  describe 'proficiency_bonus' do
    it 'is 2 by default' do
      monster = described_class.new
      expect(monster.proficiency_bonus).to eq 2
    end

    it 'is determined by the challenge_rating' do
      expected_bonuses = [2, 2, 2, 2, 3, 4, 5, 6, 7, 8, 9]
      %w[0 1/8 1/2 4 5 9 13 17 21 25 29].zip(expected_bonuses).each do |cr, bonus|
        bandit = build(:bandit, challenge_rating: cr)
        expect(bandit.proficiency_bonus).to eq bonus
      end
    end
  end
end
