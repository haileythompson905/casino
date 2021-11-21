# Start game player has a name and an initial bankroll
# Player can go to different games via menu
# Slots
# High / Low
# Player places bet and wins / loses (hint: rand)
# Player's bankroll goes up and down with wins and losses

require_relative 'player'
require_relative 'roulette'


class Casino
  def initialize
    @player = Player.new
    show_menu
  end

  def show_menu
    begin
      puts "What game to play?"
      puts "1. Roulette"
      puts "2. Check dollar amount"
      puts "3. Exit"
      response = gets.strip.to_i
    raise "Error Bad input" unless response > 0 && response < 6
  case response
  when 1
    Roulette.new(@player)
  when 2
    puts "You have $#{@player.money}" 
  when 3
    puts "Goodbye! Come back soon!"
    Exit
  else 
    raise
  end
  show_menu
  rescue StandardError => e
      puts e
      retry
    end
  end
end

Casino.new