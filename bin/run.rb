require './config/environment'

# Pokemon.pokemon_url_array
# Pokemon.build_pokemon_hash
# Pokemon.fill_poke_database

# run rake db:seed

Enemy.load_enemies
# binding.pry
puts "Welcome to Pokemon Battle!\n"

Catpix::print_image "https://usercontent2.hubstatic.com/13805615_f520.jpg",
  :limit_x => 0.5,
  :limit_y => 0,
  :center_x => true,
  :center_y => true,
  :bg => "white",
  :bg_fill => false

# sleep(2)

puts "Please enter your name:"
name = gets.chomp
new_user = User.create(name: name)

User.select_pokemon
user_input = gets.chomp.downcase
until (Pokemon.get_names.include?(user_input) == true)
  User.wrong_pokemon
  user_input = gets.chomp
end

new_user.choose_pokemon(user_input)


puts "\nDo you want to see your pokemon stats? [Y/N]"
  stat_input = gets.chomp.downcase
  until (stat_input == 'y' || stat_input == 'n')
    puts "Please enter Y or N: "
    stat_input = gets.chomp.downcase
  end

  if stat_input == 'y'
    puts "\nYour pokemon stats are...\n\n"
    new_user.view_stats
  end

#Enemy.create(name: "Computer")

enemy1 = Enemy.random_enemy
enemy_pokemon = enemy1.random_pokemon
puts "\nAre you ready to battle? [Y/N]"
battle_input = gets.chomp.downcase
until (battle_input == 'y' || battle_input == 'n')
  puts "Please enter Y or N: "
  battle_input = gets.chomp.downcase
end

until battle_input == 'y'
  sleep(1)
  puts "\n."
  sleep(1)
  puts "\n."
  sleep(1)
  puts "\n."
  puts "\nAre you ready now? Please enter Y or N: "
  battle_input = gets.chomp.downcase
end




 # if gets.chomp.downcase == 'y'
   puts "\nYou are battling #{enemy1.name}."
   puts "\nDo you want to see #{enemy1.name}'s pokemon stats? [Y/N]"
   e_stat_input = gets.chomp.downcase
   until (e_stat_input == 'y' || e_stat_input == 'n')
     puts "Please enter Y or N: "
     e_stat_input = gets.chomp.downcase
   end

   if e_stat_input == 'y'
     puts "\n#{enemy1.name}'s pokemon stats are... \n\n"
     enemy1.view_stats
   end

   puts "\nStart Battle? [Y/N]\n"
   start_input = gets.chomp.downcase
   until (start_input == 'y' || start_input == 'n')
     puts "Please enter Y or N: "
     start_input = gets.chomp.downcase
   end

   until (start_input == 'y')
     sleep(1)
     puts "\n."
     sleep(1)
     puts "\n."
     sleep(1)
     puts "\n."
     puts "\nStart battle now? Please enter Y or N: "
     start_input = gets.chomp.downcase
   end

    if start_input == 'y'
      fight = Battle.create(user_id: new_user.id, enemy_id: enemy1.id)
      puts "Pow!"
      sleep(1)
      puts "Scratch!"
      sleep(1)
      puts "Ouch!"
      sleep(1)
      fight.whos_the_winner
      # binding.pry
    end
 # else
 #   puts "Bye"
 # end
 # Pokemon.pokemon_url_array
 # Pokemon.build_pokemon_hash
 # Pokemon.all_pokemon.each do |pokemon|
 #   pokemon[:hp] = Pokemon.all

 Enemy.clear_enemies
 User.clear_users








# binding.pry
