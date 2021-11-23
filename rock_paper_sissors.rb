require_relative 'player'

class Rock_Paper_Scissors
  def initialize(player)
    @player = player
    play
  end
  def play
  puts "Place a bet for Rock Paper Scissors or type none to continue"
  bet = gets.strip.to_f
    if bet == 0
      return
    end
  if bet > 0 && bet < @player.money + 1
    puts "Enter Rock, Paper, or Scissors!"
    user_input = gets.chomp.downcase
      if user_input == "rock"
        dealer_choice = rand(1..3)
          if dealer_choice == 3
            puts "You chose Rock"
            puts "Casino chose Scissors"
            puts "You won"
            @player.money += bet
          elsif dealer_choice == 2
            puts "You chose Rock"
            puts "Casino chose Paper"
            puts "You won"
            @player.money -= bet
          elsif dealer_choice == 1
            puts "You both picked Rock"
            puts "You tied!"
          end
      elsif user_input == "paper"
        dealer_choice = rand(1..3)
          if dealer_choice == 1
            puts "You chose Paper"
            puts "Dealer chose Scissors"
            puts "You won"
            @player.money += bet
          elsif dealer_choice == 3
            puts "You chose Paper"
            puts "Dealer chose Scissors"
            puts "You lost"
            @player.money -= bet
          elsif dealer_choice == 2
            puts "You both chose Paper"
            puts "You Tied!"
          end
        elsif user_input == "scissors"
          dealer_choice = rand(1..3)
          if dealer_choice == 2
            puts "You chose Scissors"
            puts "Dealer chose Paper"
            puts "You won"
            @player.money += bet
          elsif dealer_choice == 1
            puts "You chose Scissors"
            puts "Dealer chose Rock"
            puts "You lost"
            @player.money -= bet
          elsif dealer_choice == 3
            puts "You both chose Scissors"
            puts "You Tied!"
          return
        end
      end
    end
  end
end