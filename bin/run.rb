require './config/environment'

# Pokemon.pokemon_url_array
# Pokemon.build_pokemon_hash

puts "Welcome to Pokemon Battle!\n"
sleep(2)

puts "Please enter your name:"
name = gets.chomp
new_user = User.create(name: name)
puts "\nHere are the pokemon you can choose from..\n\n"
Pokemon.populate_list

puts "\nChoose a pokemon: "
user_pokemon = gets.chomp
new_user.choose_pokemon(user_pokemon)

puts "\nDo you want to see your pokemon stats? [Y/N]"
  if gets.chomp.downcase == "y"
    puts "\nYour pokemon stats are ...\n\n"
    new_user.view_stats
  end

#Enemy.create(name: "Computer")
enemy1 = Enemy.create(name: "Michael")
enemy_pokemon = enemy1.random_pokemon
puts "\nAre you ready to battle? [Y/N]"
 if gets.chomp.downcase == 'y'
   puts "\nYou are battling #{enemy1.name}."
   puts "\nDo you want to see #{enemy1.name}'s pokemon stats? [Y/N]"
   if gets.chomp.downcase == 'y'
     puts "\nYour enemy's pokemon stats are.. \n\n"
     enemy1.view_stats
   end
   puts "\nStart Battle? [Y/N]\n"
    if gets.chomp.downcase == 'y'
      fight = Battle.create(user_id: new_user.id, enemy_id: enemy1.id)
      puts "Pow!"
      sleep(1)
      puts "Scratch!"
      sleep(1)
      puts "Ouch!"
      sleep(1)
      fight.whos_the_winner
    end 
 else
   puts "Bye"
 end








# binding.pry
