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

  def new_battle
    x=0
    enemy_pokemon_hp
    user_pokemon_hp
    get_user_attack
    get_enemy_attack
    until @u_hp <= 0 || @e_hp <=0
      self.fight_with_attack_div_3
      puts "Attack Number #{x + 1}!"
      puts "Your pokemon's HP: #{@u_hp}"
      puts "Your enemy's pokemon's HP: #{@e_hp}"
      x += 1
      sleep(2)
      Catpix::print_image "#{self.random_img_url}",
        :limit_x => 0.8,
        :limit_y => 0,
        :center_x => true,
        :center_y => false,
        :bg => "white",
        :bg_fill => false
    end
  end

  def random_img_url
    img_arr = ["https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqtGPBlGkuGyekTVuMRKEYOlhxr1hyuHs0XR3q18j8jHgUNKdP", "http://clipground.com/images/sparks-clipart-7.jpg", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRljXdnk4h4pKTZLUSfxHgL8KirYiumUxGA8rVI3l8-FwHO7wQK"]
    img_arr.sample
  end

  def fight_with_attack_div_3
    @e_hp -=  (@u_attack / 3)
    @u_hp -= (@e_attack / 3)
  end

  def whos_the_winner
    self.new_battle
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
