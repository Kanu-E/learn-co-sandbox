class CLI

    def start
        introduction
        get_Player_stats
        # binding.pry
        main_loop
    end

    def introduction

        puts "\n\n\n"
        puts "WELCOME TO THE MY LFC APP"
        puts "\n"
        puts 'Liverpool Football club have been confirmed as the english champions for the 2019/2020 season, here you can find the stats for every player who appeared for the club during the course of the season.'  
        sleep(1)
        puts "\n\n\n"
    end
    
    def get_Player_stats
      Apimanager.new.get_players("Premier League")
    end
    
    def main_loop
      loop do 
        menu
        input = choose_player
        case input
            when "exit"
                break
            when "invalid"
                next
            else
              puts player_details_1(input)
              puts player_position_details(input)
              puts player_details_2(input)
            end
          end
    
      # binding.pry
    end
    
    def menu
      display_players
      display_instructions
      # binding.pry
    end
    
    def display_players
      players = Players.all
      players.each.with_index(1) {|player, index| puts "#{index}. #{player.name}, Age: #{player.age}, Nation: #{player.nation}"}
    end
    
    def display_instructions
        puts <<-INST
        
Please select the player who you will like to view his statistics by inputing a number or type 'exit' to exit the program.        
        
        INST
    end
    
    def choose_player
        input = gets.strip.downcase
        commands = ["exit", "next"]
        return input.downcase if commands.include?(input.downcase)
        if input.to_i.between?(1, Players.all.length)
            return input.to_i 
        else
            puts "Please enter a number between 1 and #{Players.all.length})"
            return "invalid"
         end
    end
    
    def player_details_1(i)
      player = Players.all[i - 1]
      player.show_player_details_1
    end
    
    def player_position_details(i)
      player = Players.all[i - 1]
      player.show_player_details_2
    end
    
    def player_details_2(i)
      player = Players.all[i - 1]
      player.show_player_details_3
    end   
  
  end