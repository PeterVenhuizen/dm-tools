# frozen_string_literal: true

FactoryBot.define do
  factory :bandit, class: 'Monster' do
    name { 'Bandit' }
    size { 'Medium' }
    species { 'Humanoid' }
    alignment { 'any non-lowful alignment' }
    languages { 'Any one language (usually Common)' }
    armor_class { '12 (leather armor)' }
    hit_points { 11 }
    hit_dice { '2d8 + 2' }
    ability_score do
      {
        strength: 11,
        dexterity: 12,
        constitution: 12,
        intelligence: 10,
        wisdom: 10,
        charisma: 10
      }
    end
    challenge_rating { '1/8' }
    xp { 25 }
    proficiency_bonus { 2 }
    speed do
      {
        walk: 30
      }
    end
  end

  factory :cat, class: 'Monster' do
    name { 'Cat' }
    size { 'Tiny' }
    species { 'Beast' }
    alignment { 'unaligned' }
    languages { '' }
    armor_class { '12' }
    hit_points { 2 }
    hit_dice { '1d4' }
    ability_score do
      {
        strength: 3,
        dexterity: 15,
        constitution: 10,
        intelligence: 3,
        wisdom: 12,
        charisma: 7
      }
    end
    challenge_rating { '0' }
    xp { 10 }
    proficiency_bonus { 2 }
    speed do
      {
        climb: 30,
        walk: 40
      }
    end
  end

  factory :cat, class: 'Monster' do
    name { 'Harpy' }
    size { 'Medium' }
    species { 'Beast' }
    alignment { 'chaotic evil' }
    languages { 'Common' }
    armor_class { '11' }
    hit_points { 38 }
    hit_dice { '7d8 + 7' }
    ability_score do
      {
        strength: 12,
        dexterity: 13,
        constitution: 12,
        intelligence: 7,
        wisdom: 10,
        charisma: 13
      }
    end
    challenge_rating { '1' }
    xp { 200 }
    proficiency_bonus { 2 }
    speed do
      {
        fly: 40,
        walk: 20
      }
    end
  end
end
