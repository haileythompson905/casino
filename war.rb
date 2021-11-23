require_relative 'deck'
require_relative 'player'

class War
  def initialize(player)
     @player = player
     @deck = Deck.new
     play
  end

  def play
    puts "Place a bet for War or type none to return to menu."
    bet = gets.strip.to_f
    if bet == 0
      return
    end
      if bet > 0 && bet < @player.money + 1
        first_card = @deck.pull_card
        second_card = @deck.pull_card
        puts "Your card is the #{first_card}"
        puts "The dealer card is the #{second_card}"
        if first_card.to_i > second_card.to_i
          puts "You won!"
          @player.money += bet
        elsif first_card.to_i < second_card.to_i
          puts "You lost"
          @player.money -= bet
        end
      else
        puts "Place a valid bet please"
        play
      end
    end
  end