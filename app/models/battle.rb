class Battle < ActiveRecord::Base


  def user_pokemon_hp
    found_user = User.all.find do |user|
      self.user_id == user.id
    end
    found_user_pokemon = Pokemon.all.find do |pokemon|
    found_user.pokemon_id == pokemon.id
    end

    found_user_pokemon[:hp]
  end

  def enemy_pokemon_hp
    found_enemy = Enemy.all.find do |enemy|
      self.enemy_id == enemy.id
    end
    found_enemy_pokemon = Pokemon.all.find do |pokemon|
      found_enemy.pokemon_id == pokemon.id
    end
    found_enemy_pokemon[:hp]
  end

  def whos_the_winner
    if user_pokemon_hp > enemy_pokemon_hp
      puts "You are the winner!"
    elsif enemy_pokemon_hp > user_pokemon_hp
      puts "#{self.enemy_name} is the winner!"
    end
  end

  def enemy_name
    found_enemy = Enemy.all.find do |enemy|
      enemy.id == self.enemy_id
    end
    found_enemy[:name]
  end

end
