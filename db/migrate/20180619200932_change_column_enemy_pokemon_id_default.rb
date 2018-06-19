class ChangeColumnEnemyPokemonIdDefault < ActiveRecord::Migration[5.2]
  def change
    change_column(:enemies, :pokemon_id, :integer, pokemon_id: nil )
  end
end
