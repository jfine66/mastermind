# frozen_string_literal: true

require_relative 'game_rules'
# Used to crack player code
class CodeMaker
  def initialize
    @game_over = false
    @number_of_guesses = 12
    @rules = GameRules.new
    @code = SecretCode.new
  end

  def game_start
    @rules.codemaker_rules
    @secret_code = @code.human_made_code
    puts "Your secret code is: #{@secret_code}"

    until @game_over
      puts "The computer guesses: #{computer_guess}"
      check_code(computer_guess)
      @game_over = true if @number_of_guesses.zero?
    end
  end

  def check_code(guess)
    if guess == @secret_code
      puts 'The computer cracked your code'
      @game_over = true
    elsif guess != @secret_code
      @number_of_guesses -= 1
    end
  end

  def computer_guess
    @guess = Array.new(4) { @code.color_choices.sample }
    @guess.join(' ')
  end
end
