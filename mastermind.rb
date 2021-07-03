require_relative 'game_rules'
require_relative 'code_breaker'

# Makes game logic
class StartOfGame
  def initialize
    @rules = GameRules.new
    @breaker = CodeBreaker.new
  end

  def game_start
    @rules.basic_rules
    @selection = gets.chomp
    check_selection(@selection)
  end

  def check_selection(choice)
    if choice == 'codebreaker'
      @breaker.game_start
    end
  end
  # End of class
end

game = StartOfGame.new
game.game_start