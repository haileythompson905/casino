require_relative 'player.rb'
require_relative 'deck.rb'

class BlackJack
  def initialize(player)
    @player = player
    @deck = Deck.new
    play
  end

  def play
    puts "How much would you like to wager?"
    @wager = gets.strip.to_i
      if @wager > 0 && @wager <= @player.money
        user_card1 = @deck.pull_card
        user_card2 = @deck.pull_card
        puts "--------------------------------"
        puts "Your first card is #{user_card1}"
        puts "Your second card is #{user_card2}"
        @user_total = user_card1.to_i + user_card2.to_i
        puts "Your hand total is #{@user_total}"
        if @user_total == 21
          puts "Black Jack! Lets see what the dealer gets."
          dealers_turn
        else
          hit_or_stay
        end
      else
        if @wager > @player.money
          puts "You dont have enough! Try again."
          play
        else
          puts "Please enter a valid amount."
          play
        end
      end
  end
end

def dealers_turn
  puts "--------------------------------"
  puts "      Dealers turn to play!"
  dealers_card1 = @deck.pull_card
  dealers_card2 = @deck.pull_card
  puts "Dealers first card is #{dealers_card1}"
  puts "Dealers second card is #{dealers_card2}"
  @dealer_total = dealers_card1.to_i + dealers_card2.to_i
  puts "Dealers hand total is #{@dealer_total}"
    if @dealer_total.between?(1,16)
      new_card = @deck.pull_card
      puts "The dealers next card is #{new_card}"
      @dealer_total = new_card.to_i + @dealer_total
      puts "The dealers hand total is now #{@dealer_total}"
        if @dealer_total > 21
          @player.money += @wager
          puts "Dealer busted, you won!"
          return
        elsif @dealer_total < @user_total
          @player.money += @wager
          puts "You won!"
          return
        elsif @dealer_total > @user_total
          @player.money -= @wager
          puts "Dealer won!"
          return
        else @dealer_total == @user_total
          puts "You tied! You keep your wager."
          return
        end     
    else @dealer_total.between?(17,21)
        if @dealer_total > 21
          @player.money += @wager
          puts "Dealer busted, you won!"
          return
        elsif @dealer_total < @user_total
          @player.money += @wager
          puts "You won!"
          return
        elsif @dealer_total > @user_total
          @player.money -= @wager
          puts "Dealer won!"
          return
        else @dealer_total == @user_total
          puts "You tied! You keep your wager."
          return
        end
    end
end

def hit
  new_card = @deck.pull_card
  puts "Your next card is #{new_card}"
  @user_total = new_card.to_i + @user_total
  puts "Your hand total is now #{@user_total}"
  if @user_total > 21
    @player.money -= @wager
    puts "You busted! Better luck next time!"
    return
  elsif @user_total == 21
    puts "Black Jack! Lets see what the dealer gets."
    dealers_turn
  else @user_total < 21
    hit_or_stay
  end
end

def hit_or_stay
  puts "Please enter hit or stay"
  choice = gets.strip.downcase
  if choice == "hit"    
    hit
  elsif choice == "stay"
    dealers_turn
  else
    puts "Please enter a valid choice."
  end
end