class Enemy < ActiveRecord::Base
  # Generates random pokemon id and assigns it to the enemy instance.

  def random_pokemon
    r = Random.rand(1..20)
    found_pokemon = Pokemon.find(r)
    self.pokemon_id = found_pokemon.id
    self.save
  end
# Finds the pokemon by id that matches enemy's pokemon_id and returns his or her pokemon's stats (name, hp, attack)
  def view_stats
    my_pokemon = Pokemon.all.find do |pokemon|
      pokemon.id == self.pokemon_id
    end
    puts "NAME: #{my_pokemon[:name].capitalize}"
    puts "HP: #{my_pokemon[:hp]}"
    puts "ATTACK: #{my_pokemon[:attack]}"
  end
  # This creates multiple enemy instances and saves it to the database

  def self.load_enemies
    Enemy.create(name: "Jessie")
    Enemy.create(name: "James")
    Enemy.create(name: "Giovanni")
    Enemy.create(name: "Archie")
    Enemy.create(name: "Ash Catchem")
    Enemy.create(name: "Brock")
    Enemy.create(name: "Misty")
    Enemy.create(name: "Professor Oak")
    Enemy.create(name: "Donald Trump")
  end
  # After the game ends, this method will clear the list of enemy instances

  def self.clear_enemies
    Enemy.delete_all
  end

    # Generates a random enemy instance from the list of 9 enemy instances
  def self.random_enemy
    r = Random.rand(1..Enemy.all.count)
    found_enemy = Enemy.find(r)
    found_enemy
  end

  # def choose_pokemon(user_input)
  #   found_pokemon = Pokemon.find_by_name(user_input)
  #   self.pokemon_id = found_pokemon.id
  #   self.save
  # end

end
