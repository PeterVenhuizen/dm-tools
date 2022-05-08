class AddUniqueConstraintToMonsterName < ActiveRecord::Migration[7.0]
  def change
    add_index :monsters, :name, unique: true
  end
end
