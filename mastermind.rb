require './code_breaker'

# Makes game logic
class GameLogic
  def initialize
    @breaker = CodeBreaker.new
  end

  def game_start
    puts 'Welcome to mastermind. A simple code breaking game. Would you like to be the codebreaker or codemaker?'
    @selection = gets.chomp
    check_selection(@selection)
  end

  def check_selection(choice)
    @breaker.game_start if choice == 'codebreaker'
  end
  # End of class
end

# Holds all Game rules
class GameRules
  def initialize; end
end

game = GameLogic.new
game.game_start
