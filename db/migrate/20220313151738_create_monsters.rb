class CreateMonsters < ActiveRecord::Migration[7.0]
  def change
    create_table :monsters, id: :uuid do |t|
      t.string :name
      t.string :size
      t.string :species
      t.string :armor_class
      t.integer :hit_points
      t.string :challenge_rating, default: 0
      t.string :alignment
      t.string :hit_dice
      t.hstore :ability_score, default: {strength: 10, dexterity: 10, constitution: 10, intelligence: 10, wisdom: 10, charisma: 10}
      t.integer :xp
      t.integer :proficiency_bonus, default: 2
      t.hstore :speed, default: {burrow: 0, climb: 0, fly: 0, swim: 0, walk: 0}
      t.string :languages

      t.timestamps
    end
  end
end
