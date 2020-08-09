

def game_hash
game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => { "Alan Anderson" => {
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1
      }, "Reggie Evans" => {
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7
      }, "Brook Lopez" => {
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15
      }, "Mason Plumlee" => {
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 12,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5
      }, "Jason Terry" => {
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => { "Jeff Adrien" => {
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2
      }, "Bismak Biyombo" => {
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 7,
        :blocks => 15,
        :slam_dunks => 10
      }, "DeSagna Diop" => {
        :number => 2,
        :shoe => 14,
        :points =>24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5
      }, "Ben Gordon" => {
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0
      }, "Brendan Haywood" => {
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 22,
        :blocks => 5,
        :slam_dunks => 12
        }
      }
    }
  }

end 

# CALLING METHODS WITHIN METHODS
# You'll be building a series of methods that operate on the above game hash to return certain information about the teams and players. Each method will operate on the game hash by calling the game_hash method that returns the game_hash. In other words, since our game_hash method returns our hash, you can think of the game_hash like a variable that points to our hash and operate on it just as you would with hashes in previous lessons.

# For example, let's say we want to build a method, home_team_name, that returns the name of the home team, "Brooklyn Nets". We can call the method game_hash inside of our home_team_name method and operate on the game_hash:

# def home_team_name
#   game_hash[:home][:team_name]
# end
 

def num_points_scored(player_name)
playerpoints = 0 
 game_hash.collect do |team, stats|
  stats[:players].collect do |player, data|

    if player == player_name
      playerpoints += data[:points]
    end 
  end 
 end 
 playerpoints
end 


# Build a method, shoe_size, that takes in an argument of a player's name and returns the shoe size for that player.

# Think about how you will find the shoe size of the correct player. How can you check and see if a player's name matches the name that has been passed into the method as an argument?

def shoe_size(player_name)
playershoesize = 0 
 game_hash.collect do |team, stats|
  stats[:players].collect do |player, data|

    if player == player_name
      playershoesize += data[:shoe]
    end 
  end 
 end 
 playershoesize
end 




# Build a method, team_colors, that takes in an argument of the team name and returns an array of that teams colors.


def team_colors(team_name)
  colors = nil 
  game_hash.collect do |team, stats|
    if stats[:team_name] == team_name
      colors = stats[:colors]
    end 
  end 
colors
end 

# Build a method, team_names, that operates on the game hash to return an array of the team names.

def team_names
  game_hash.collect do |team, stats|
    stats[:team_name]
  end 
end 

team_names


# Build a method, player_numbers, that takes in an argument of a team name and returns an array of the jersey number's for that team.



def player_numbers(team_name)
  numbs = [] 
  game_hash.collect do |team, stats|
    if stats[:team_name] == team_name
      stats[:players].collect do |player, data|
        numbs.push(data[:number])
      end 
    end 
  end 
numbs
end 



# Build a method, player_stats, that takes in an argument of a player's name and returns a hash of that player's stats.

def player_stats(player_name)
playerdata = nil 
 game_hash.collect do |team, stats|
  stats[:players].collect do |player, data|

    if player == player_name
      playerdata = data
    end 
  end 
 end 
playerdata
end 




# Build a method, big_shoe_rebounds, that will return the number of rebounds associated with the player that has the largest shoe size. Break this one down into steps:

# First, find the player with the largest shoe size
# Then, return that player's number of rebounds



def big_shoe_rebounds
  playerrebound = nil 
  numbs = []
  biggest_shoesize = nil 
      game_hash.collect do |team, stats|
        stats[:players].collect do |player, data|
          numbs.push(data[:shoe])
          biggest_shoesize = numbs.sort[-1] 
             data.collect do |category, stat|
               if category == :shoe 
                if stat == biggest_shoesize
                  playerrebound =  data[:rebounds]
                end 
              end
            end
          end
        end
        playerrebound
      end
  
  
  

# METHOD WORKS:

# def big_shoe_rebounds
#   playerrebound = nil 
#   numbs = [] 
#   game_hash.collect do |team, stats|
#       stats[:players].collect do |player, data|
#         numbs.push(data[:shoe])
#       biggest_shoesize = numbs.sort[-1]
#     end 
#   end 
# biggest_shoesize = numbs.sort[-1]

# game_hash.collect do |team, stats|
#       stats[:players].collect do |player, data|
#         data.collect do |category, stat|
#           if category == :shoe 
#             if stat == biggest_shoesize
#             playerrebound =  data[:rebounds]
#             end 
#           end 
#       end 
#     end 
# end 
# playerrebound
# end 

big_shoe_rebounds









