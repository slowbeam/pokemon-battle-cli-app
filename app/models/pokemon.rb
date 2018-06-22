class Pokemon < ActiveRecord::Base


  @poke_url_array = []
  @@all_pokemon = []
#Takes only the URL from the first 20 pokemon in the Pokemon API and puts them in an array.
  def self.pokemon_url_array

    pokemon_url = "https://pokeapi.co/api/v2/pokemon/?limit=20"
      all_pokemon = RestClient.get(pokemon_url)
      pokemon_hash = JSON.parse(all_pokemon)
      pokemon_hash["results"].each do |pokemon|
      @poke_url_array << pokemon["url"]
      end
      @poke_url_array
  end
  #Using the array of pokemon URLs we enter each one and take only the Pokemon's name, attack and HP and put this information into a hash as the values for name:, hp: and attack:
  #Finally we add the hash of each pokemon to an empty array called all_pokemon
  def self.build_pokemon_hash
    @poke_url_array.each do |url|
      pokemon_hash = {}
      poke_data = RestClient.get(url)
      indiv_poke_hash = JSON.parse(poke_data)
      pokemon_hash[:name] = indiv_poke_hash["name"]
      indiv_poke_hash["stats"].each do |x|
        if x["stat"]["name"] == "hp"
          pokemon_hash[:hp] = x["base_stat"]
        end
        if x["stat"]["name"] == "attack"
          pokemon_hash[:attack] = x["base_stat"]
        end
      end
      @@all_pokemon << pokemon_hash
    end
  end

  def self.all_pokemon
    @@all_pokemon
  end
#We collect only the names of each pokemon from the database
  def self.get_names
    Pokemon.all.map do |pokemon|
      pokemon[:name]
    end
  end
#Creates a new row in the Pokemon table for each pokemon from the all_pokemon array and assigns its name, attack and hp to the name, attack and hp columns
  def self.fill_poke_database
    @@all_pokemon.each do |pokemon|
      Pokemon.create(name: pokemon[:name], attack: pokemon[:attack], hp: pokemon[:hp])
    end
  end
  #This method will delete all duplicate entries from the pokemon table in the database
  def self.dedupe
      grouped = Pokemon.all.group_by{|model| [model.name, model.hp, model.attack]}
      grouped.values.each do |duplicates|
        first_one = duplicates.shift
        duplicates.each{|double| double.destroy}
      end
  end
#Displays a list of all the pokemon's names in the terminal with each name on a new line
  def self.populate_list
    list = Pokemon.all.map do |pokemon|
      pokemon[:name]
    end
    puts list
  end
end
