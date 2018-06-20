class Pokemon < ActiveRecord::Base


  @poke_url_array = []
  @@all_pokemon = []

  def self.pokemon_url_array

    pokemon_url = "https://pokeapi.co/api/v2/pokemon/?limit=20"
      all_pokemon = RestClient.get(pokemon_url)
      pokemon_hash = JSON.parse(all_pokemon)
      pokemon_hash["results"].each do |pokemon|
      # binding.pry
      @poke_url_array << pokemon["url"]
      end
      @poke_url_array
  end

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
        # binding.pry
      # pokemon_hash[:hp] = indiv_poke_hash["stats"][stat]
      # binding.pry
      end
      @@all_pokemon << pokemon_hash
    end
    # @@all_pokemon
  end

  def self.all_pokemon
    @@all_pokemon
  end

  def self.get_names
    Pokemon.all.map do |pokemon|
      pokemon[:name]
    end
  end

  def self.fill_poke_database
    @@all_pokemon.each do |pokemon|
      Pokemon.create(name: pokemon[:name], attack: pokemon[:attack], hp: pokemon[:hp])
      # binding.pry
    end
  end

  def self.dedupe
      grouped = Pokemon.all.group_by{|model| [model.name, model.hp, model.attack]}
      grouped.values.each do |duplicates|
        first_one = duplicates.shift
        duplicates.each{|double| double.destroy}
      end
  end

  def self.populate_list
    list = Pokemon.all.map do |pokemon|
      pokemon[:name]
    end
    puts list
  end




end
