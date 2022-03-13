# frozen_string_literal: true

class Monster < ApplicationRecord
  validates :challenge_rating,
            inclusion: {
              in: %w[1/8 1/4 1/2] + [*'0'..'30'],
              message: '%{value} is not a valid challenge rating'
            }

  validates :name,
            presence: {
              minimum: 2,
              message: 'must be at least 2 characters long'
            }

  validates :size,
            inclusion: { in: %w[Tiny Small Medium Large Huge Gargantuan] }

  validates :xp,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: 0
            }
end
