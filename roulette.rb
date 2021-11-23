require_relative 'player'


class Roulette  
  attr_accessor :player

  def initialize (player)
    @player = player
    puts "Welcome #{@player.name} to the great game of Roulette!"
    user_choice
  end

  def roulette_menu
    puts "Welcome to roulette! What would you like to do?"
    puts "1. Bet on a number"
    puts "2. Bet on red or black"
    puts "3. Leave roulette"
    puts "4. Display current wallet amount"
    @choice = gets.chomp.to_i
  end
  
  def user_choice
    while @choice !=3
      @choice = roulette_menu
      case @choice
      when 1
      bet_num
      if @num_choice == @num ? winning_bet : losing_bet
      end
    when 2
      red_black
      if @color_choice == @color ? winning_bet : losing_bet
    end
    when 3
      break # exit to main casino
    when 4
      @player.printWallet
    end
  end
  end



  def bet_amount
    puts "How much do you want to bet?"
    @money = gets.chomp.to_i
  end

  def bet_num
    bet_amount
    @money_num = @money
    puts "What number do you want to bet on?"
    @num_choice = gets.chomp.to_i
  end

  def red_black
    bet_amount
    @money_color = @money
    puts "What's is going to be? Red or black"
    @color_choice = gets.chomp.downcase
    spin
  end

  def spin
    @num = rand(36)
    if @num % 2 == 0
    @color = "red"
    else
    @color = "black"
    # end
    puts "Wheel reveled: #{@num} #{@color}"
  end

  def winning_bet
    puts "You've won!!"
    @player.add_wallet(@money_num)
    puts @player.printWallet
    roulette_menu
  end

  def losing_bet
    puts "So sorry, but you've lost"
    @player.deduct_wallet(@money_num)
    puts @player.printWallet
    roulette_menu
  end
end
end
