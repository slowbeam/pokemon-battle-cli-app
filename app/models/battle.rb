class Battle < ActiveRecord::Base
  # e_hp = enemy's pokemon hp
  # u_hp = user's pokemon hp
  # u_attack = user's pokemon attack
  # e_attack = enemy's pokemon attack
  @e_hp
  @u_hp
  @u_attack
  @e_attack

 # Generates a battle
  def new_battle
    #This variable counts the number of battle.
    x=1
     # Get enemy and user's pokemon hp
    enemy_pokemon_hp
    user_pokemon_hp
    # Get enemy and user's pokemon attack
    get_user_attack
    get_enemy_attack

    # While both hp is above 0
    while @u_hp > 0 || @e_hp > 0
      puts "\nAttack Number #{x}!"

      #Generates a random image from our list of image urls
      self.class.print_image(self.random_img_url, 0.8)

      #Enemy will attack first.
      subtract_user_hp

      # If the user's hp goes below 0, assigns user's hp as 0 and return the result.
      if (@u_hp <= 0)
        @u_hp = 0
        puts "Your pokemon's HP: #{@u_hp}"
        puts "Your enemy's pokemon's HP: #{@e_hp}"
        puts "\n#{self.enemy_name} is the winner!"
        break
      end

        # User's turn to attack
      subtract_enemy_hp
      if (@e_hp <= 0)
        @e_hp = 0
        puts "Your pokemon's HP: #{@u_hp}"
        puts "Your enemy's pokemon's HP: #{@e_hp}"
        puts "\nYou are the winner!"
        break
      end

      # If the enemy's pokemon hp goes below 0, assigns enemy's hp as 0 and return the result.
      if (@u_hp > 0 && @e_hp > 0)
        puts "Your pokemon's HP: #{@u_hp}"
        puts "Your enemy's pokemon's HP: #{@e_hp}"
        sleep(2)
      end

      #Increment the number of battles (or Attack)
      x += 1
    end
  end

  # Generate random image out of these 3 urls
  def random_img_url
    img_arr = ["https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqtGPBlGkuGyekTVuMRKEYOlhxr1hyuHs0XR3q18j8jHgUNKdP", "http://clipground.com/images/sparks-clipart-7.jpg", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRljXdnk4h4pKTZLUSfxHgL8KirYiumUxGA8rVI3l8-FwHO7wQK"]
    img_arr.sample
  end

  # Enemy's turn to attack. Subtract user's pokemon hp by enemy's attack divided by 3
  def subtract_user_hp
    @u_hp -= (@e_attack / 3)
  end

  # User's turn to attack. Subtract enemy's pokemon hp by user's attack divided by 3
  def subtract_enemy_hp
    @e_hp -=  (@u_attack / 3)
  end

  # Get enemy's name from Enemy class that matches enemy's id
  def enemy_name
    found_enemy = Enemy.all.find do |enemy|
      enemy.id == self.enemy_id
    end
    found_enemy[:name]
  end

  # Get user's pokemon that matches User_id and user's pokemon_id from our database
  def get_user_pokemon
    found_user = User.all.find do |user|
      self.user_id == user.id
    end
    found_user_pokemon = Pokemon.all.find do |pokemon|
    found_user.pokemon_id == pokemon.id
    end
  end
  # Get enemy's pokemon that matches enemy_id and enemy's pokemon_id from our database
  def get_enemy_pokemon
    found_enemy = Enemy.all.find do |enemy|
      self.enemy_id == enemy.id
    end
    found_enemy_pokemon = Pokemon.all.find do |pokemon|
    found_enemy.pokemon_id == pokemon.id
    end
  end

  # Using the method get_user_pokemon, return the hp of user's pokemon hp
  def user_pokemon_hp
    @u_hp = get_user_pokemon[:hp]
  end

  # Using the method get_user_pokemon, return the hp of user's pokemon attack
  def get_user_attack
    @u_attack = get_user_pokemon[:attack]
  end

  # Using the method get_enemy_pokemon, return the hp of enemy's pokemon hp
  def enemy_pokemon_hp
    @e_hp = get_enemy_pokemon[:hp]
  end

  # Using the method get_enemy_pokemon, return the hp of enemy's pokemon attack
  def get_enemy_attack
    @e_attack = get_enemy_pokemon[:attack]
  end

  # Print image given urls and x_limit (that controls the size of image)
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
