class Battle < ActiveRecord::Base
  @e_hp
  @u_hp
  @u_attack
  @e_attack

  # def enemy_user_hp_message
  # end

  def new_battle
    x=0
    enemy_pokemon_hp
    user_pokemon_hp
    get_user_attack
    get_enemy_attack
    while @u_hp > 0 || @e_hp > 0
      puts "\nAttack Number #{x + 1}!"
      self.class.print_image(self.random_img_url, 0.8)

      subtract_user_hp
        if (@u_hp <= 0)
          @u_hp = 0
          puts "Your pokemon's HP: #{@u_hp}"
          puts "Your enemy's pokemon's HP: #{@e_hp}"
          puts "\n#{self.enemy_name} is the winner!"
          break
        end

        subtract_enemy_hp
          if (@e_hp <= 0)
            @e_hp = 0
            puts "Your pokemon's HP: #{@u_hp}"
            puts "Your enemy's pokemon's HP: #{@e_hp}"
            puts "\nYou are the winner!"
            break
          end

      if (@u_hp > 0 && @e_hp > 0)
        puts "Your pokemon's HP: #{@u_hp}"
        puts "Your enemy's pokemon's HP: #{@e_hp}"
        sleep(2)
      elsif @u_hp <= 0
        @u_hp = 0
        puts "Your pokemon's HP: #{@u_hp}"
        puts "Your enemy's pokemon's HP: #{@e_hp}"
        puts "\n#{self.enemy_name} is the winner!"
        break
      elsif @e_hp <= 0
        @e_hp = 0
        puts "Your pokemon's HP: #{@u_hp}"
        puts "Your enemy's pokemon's HP: #{@e_hp}"
        puts "\nYou are the winner!"
        break
      end
      x += 1
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

  def subtract_user_hp
    @u_hp -= (@e_attack / 3)
  end

  def subtract_enemy_hp
    @e_hp -=  (@u_attack / 3)
  end

  # def first_to_zero
  #   if @u_hp  == 0
  #     puts "#{self.enemy_name} is the winner!"
  #   end
  # end
  # def whos_the_winner
  #   self.new_battle
  #   if @u_hp > @e_hp
  #     puts "You are the winner!"
  #   elsif @e_hp > @u_hp
  #     puts "#{self.enemy_name} is the winner!"
  #   elsif @u_hp == @e_hp
  #     puts "It was a tie!"
  #   end
  # end

  def enemy_name
    found_enemy = Enemy.all.find do |enemy|
      enemy.id == self.enemy_id
    end
    found_enemy[:name]
  end

  def get_user_pokemon
    found_user = User.all.find do |user|
      self.user_id == user.id
    end
    found_user_pokemon = Pokemon.all.find do |pokemon|
    found_user.pokemon_id == pokemon.id
    end
  end

  def get_enemy_pokemon
    found_enemy = Enemy.all.find do |enemy|
      self.enemy_id == enemy.id
    end
    found_enemy_pokemon = Pokemon.all.find do |pokemon|
    found_enemy.pokemon_id == pokemon.id
    end
  end

  def user_pokemon_hp
    @u_hp = get_user_pokemon[:hp]
  end

  def get_user_attack
    @u_attack = get_user_pokemon[:attack]
  end

  def enemy_pokemon_hp
    @e_hp = get_enemy_pokemon[:hp]
  end

  def get_enemy_attack
    @e_attack = get_enemy_pokemon[:attack]
  end

  def self.print_image(url, x_limit)
    Catpix::print_image "#{url}",
      :limit_x => x_limit,
      :limit_y => 0,
      :center_x => true,
      :center_y => false,
      :bg => "white",
      :bg_fill => false
  end
end
