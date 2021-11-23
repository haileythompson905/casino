# Start game player has a name and an initial bankroll
# Player can go to different games via menu
# Slots
# High / Low
# Player places bet and wins / loses (hint: rand)
# Player's bankroll goes up and down with wins and losses

require_relative 'player'
require_relative 'roulette'
require_relative 'war'
require_relative 'rock_paper_sissors'
require_relative 'high_low'

class Casino
  def initialize
    @player = Player.new
    show_menu
  end

  def show_menu
    begin
      puts "What game to play?"
      puts "1. Roulette"
      puts "2. War"
      puts "3. Rock paper sissors"
      puts "4. High low"
      puts "3. Check dollar amount"
      puts "4. Exit"
      response = gets.strip.to_i
    raise "Error Bad input" unless response > 0 && response < 6
  case response
  when 1
    Roulette.new(@player)
  when 2
    War.new(@player)
  when 3
    Rock_Paper_Scissors.new(@player)
  when 4
    High_low.new(@player)
  when 5
    puts "You have $#{@player.money}" 
  when 4
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