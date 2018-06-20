class Battle < ActiveRecord::Base
  @e_hp
  @u_hp
  @u_attack
  @e_attack

  def user_pokemon_hp
    found_user = User.all.find do |user|
      self.user_id == user.id
    end
    found_user_pokemon = Pokemon.all.find do |pokemon|
    found_user.pokemon_id == pokemon.id
    end

    @u_hp = found_user_pokemon[:hp]
  end

  def enemy_pokemon_hp
    found_enemy = Enemy.all.find do |enemy|
      self.enemy_id == enemy.id
    end
    found_enemy_pokemon = Pokemon.all.find do |pokemon|
      found_enemy.pokemon_id == pokemon.id
    end
    @e_hp = found_enemy_pokemon[:hp]
  end

  def whos_the_winner
    self.fight_with_attack
    if @u_hp > @e_hp
      puts "You are the winner!"
    elsif @e_hp > @u_hp
      puts "#{self.enemy_name} is the winner!"
    elsif @u_hp == @e_hp
      puts "It was a tie!"
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

    @u_attack = found_user_pokemon[:attack]
  end

  def get_enemy_attack
    found_enemy = Enemy.all.find do |enemy|
      self.enemy_id == enemy.id
    end
    found_enemy_pokemon = Pokemon.all.find do |pokemon|
    found_enemy.pokemon_id == pokemon.id
    end

    @e_attack = found_enemy_pokemon[:attack]
  end

  def fight_with_attack
      enemy_pokemon_hp
      user_pokemon_hp
      get_user_attack
      get_enemy_attack
      @e_hp -=  @u_attack
      @u_hp -= @e_attack
  end
end
