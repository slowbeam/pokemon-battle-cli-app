class Battle < ActiveRecord::Base
  @@e_hp
  @@u_hp

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
    self.fight_with_attack
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

  def get_user_attack
    found_user = User.all.find do |user|
      self.user_id == user.id
    end
    found_user_pokemon = Pokemon.all.find do |pokemon|
    found_user.pokemon_id == pokemon.id
    end

    found_user_pokemon[:attack]
  end

  def get_enemy_attack
    found_enemy = Enemy.all.find do |enemy|
      self.enemy_id == enemy.id
    end
    found_enemy_pokemon = Pokemon.all.find do |pokemon|
    found_enemy.pokemon_id == pokemon.id
    end

    found_enemy_pokemon[:attack]
  end

  def update_enemy_hp(hp)
    found_enemy = Enemy.all.find do |enemy|
      self.enemy_id == enemy.id
    end
    found_enemy_pokemon = Pokemon.all.find do |pokemon|
    found_enemy.pokemon_id == pokemon.id
    end
    found_enemy_pokemon[:hp] = hp
    found_enemy_pokemon.save
  end

  def update_user_hp(hp)
    found_user = User.all.find do |user|
      self.user_id == user.id
    end
    found_user_pokemon = Pokemon.all.find do |pokemon|
    found_user.pokemon_id == pokemon.id
    end
    found_user_pokemon[:hp] = hp
    found_user_pokemon.save
  end


  def fight_with_attack
      e_hp = enemy_pokemon_hp
      u_hp = user_pokemon_hp
      u_attack = get_user_attack
      e_attack = get_enemy_attack
      e_hp -=  u_attack
      u_hp -= e_attack
      update_user_hp(u_hp)
      update_enemy_hp(e_hp)

  end
end
