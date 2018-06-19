class User < ActiveRecord::Base


  ##Need to come back and look into the nil added to the end above
  def self.choose_name(user_input)
    self.class.name = user_input
  end

  def choose_pokemon(user_input)
    found_pokemon = Pokemon.find_by_name(user_input)
    self.pokemon_id = found_pokemon.id
    self.save
  end

  def view_stats
    my_pokemon = Pokemon.all.find do |pokemon|
      pokemon.id == self.pokemon_id
    end
    puts "NAME: #{my_pokemon[:name].capitalize}"
    puts "HP: #{my_pokemon[:hp]}"
    puts "ATTACK: #{my_pokemon[:attack]}"
  end

end
