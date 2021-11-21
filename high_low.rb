# require_relative 'deck'
# require_relative 'player'
# # require_relative 'card'



# class HighLow
#   def initialize(player)
#      @player = player
#      @deck = Deck.new
#      play
#   end

#   def play
#     puts "Place a bet for HighLow or type 0 to return to menu!"
#     bet = gets.strip.to_i
#     if bet == 0 
#       return
#     end
#       if bet > 0 && bet < @player.money + 1
#         first_card = @deck.pull_card
#         second_card = @deck.pull_card
#         puts "The card is #{first_card}"
#         print "(higher/lower): "
#         guess = gets.strip.downcase
#         puts "The second card is #{second_card}"
#         if guess == 'higher'
#           if is_correct = first_card.to_i <= second_card.to_i
#             puts "You won!"
#             play
#         else 
#            puts "You lost"
#            play
#        end
#        bet *= -1 if !is_correct
#        @player.money += bet
#      else 
#         if is_correct = first_card.to_i > second_card.to_i
#          puts "You won!"
#          play
#       else 
#           puts "You lost"
#           play
#       end
#       bet *= -1 if !is_correct
#       @player.money += bet
#     end
#   else
#       puts "Try a valid bet"
#       play
#     end
#   end
# end