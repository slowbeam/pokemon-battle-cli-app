class ChangeColumnUsersPokemonIdDefault < ActiveRecord::Migration[5.2]
  def change
    change_column(:users, :pokemon_id, :integer, pokemon_id: nil )
  end
end
