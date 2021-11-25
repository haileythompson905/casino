class Player
  attr_accessor :name, :money, :wallet
  def initialize 
    puts "What is your name?"
    @name = gets.strip
    @money = 250.0
  end
end


def deduct_wallet
  @wallet -= amount
  return @wallet
end

def add_wallet
  @wallet += amount
  return @wallet
end

def printWallet
  printf "\n You have $#{wallet}\n"
end