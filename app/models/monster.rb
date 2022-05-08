# frozen_string_literal: true

class Monster < ApplicationRecord
  validates :alignment,
            :armor_class,
            presence: true

  validates :challenge_rating,
            inclusion: {
              in: %w[1/8 1/4 1/2] + [*'0'..'30'],
              message: '%{value} is not a valid challenge rating'
            }

  validates :hit_points,
            numericality: {
              only_integer: true,
              greater_than: 0
            }

  validates :hit_dice,
            format: { with: /(\d+d\d+(?: [+-] \d+)?)/i }

  validate :hit_dice_check,
           if: -> { errors[:hit_dice].empty? }

  validates :name,
            presence: {
              minimum: 2,
              message: 'must be at least 2 characters long'
            },
            uniqueness: { case_sensitive: false }

  validates :size,
            inclusion: { in: %w[Tiny Small Medium Large Huge Gargantuan] }

  validates :species,
            inclusion: { in: %w[Aberration Beast Celestial Construct Dragon Elemental Fey Fiend Giant Humanoid
                                Monstrosity Ooze Plant Undead] }

  validates :xp,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: 0
            }

  def proficiency_bonus
    cr = Rational(challenge_rating).to_i
    cr < 5 ? 2 : 2 + ((cr - 1) / 4)
  end

  private

  def hit_dice_check
    die = hit_dice.match(/\d+(d\d+)/i).captures.first
    errors.add(:hit_dice, 'contains an invalid die') unless %w[d4 d6 d8 d10 d12 d20].include? die
  end
end
