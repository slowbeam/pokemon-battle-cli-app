class User < ActiveRecord::Base

# Assigns user input as the User name
  def self.choose_name(user_input)
    self.name = user_input
  end
# Finds the pokemon that matches the user input and saves its id to the user's pokemon_id column in the User table
  def choose_pokemon(user_input)
    found_pokemon = Pokemon.find_by_name(user_input)
    self.pokemon_id = found_pokemon.id
    self.save
  end
# Finds the pokemon by id that matches user's pokemon_id and returns his or her pokemon's stats (name, hp, attack)
  def view_stats
    my_pokemon = Pokemon.all.find do |pokemon|
      pokemon.id == self.pokemon_id
    end
    puts "NAME: #{my_pokemon[:name].capitalize}"
    puts "HP: #{my_pokemon[:hp]}"
    puts "ATTACK: #{my_pokemon[:attack]}"
  end
  # Prints the list of 20 pokemon's names and asks user to select one pokemon from the list

  def self.select_pokemon
    puts "\nHere are the pokemon you can choose from..\n\n"
    Pokemon.populate_list
    puts "\nChoose a pokemon: "
  end
# If the user chooses pokemon that is not in the list, prompts the user to choose pokemon from the list
  def self.wrong_pokemon
    puts "\nPlease choose one from the list!!"
  end
# After the game ends, this method will clear the User from the database 
  def self.clear_users
    User.delete_all
  end

end
