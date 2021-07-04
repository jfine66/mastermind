# frozen_string_literal: true

require_relative 'game_rules'
require_relative 'code_breaker'
require_relative 'code_maker'

# Makes game logic
class StartOfGame
  def initialize
    @rules = GameRules.new
    @breaker = CodeBreaker.new
    @maker = CodeMaker.new
    @selection_valid = false
  end

  def game_start
    @rules.basic_rules
    until @selection_valid
      @selection = gets.chomp
      check_selection(@selection)
    end
  end

  def check_selection(choice)
    case choice
    when 'codebreaker'
      @selection_valid = true
      @breaker.game_start
    when 'codemaker'
      @selection_valid = true
      @maker.game_start
    else
      puts 'Please enter a valid choice!'
    end
  end
  # End of class
end

game = StartOfGame.new
game.game_start
