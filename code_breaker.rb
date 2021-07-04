require_relative 'game_rules'
# frozen_string_literal: true

# Logic for player to break the code
class CodeBreaker
  def initialize
    @game_over = false
    @number_of_guesses = 12
    @secret_code = SecretCode.new
    @rules = GameRules.new
  end

  def game_start
    @rules.codebreaker_rules

    until @game_over
      puts 'Enter your guess'
      @user_input = gets.chomp
      check_user_input(@user_input)
      puts "Number of guesses remaining #{@number_of_guesses}"
      @game_over = true if @number_of_guesses.zero?
      game_ended if @game_over
    end
  end

  def game_ended
    puts "The secret code was: #{@secret_code.code}"
    puts 'Do you want to play again? Type y/n'
    choice = gets.chomp
    if choice == 'y'
      @game_over = false
      @number_of_guesses = 12
      game_start
    else
      puts 'Thank you for playing!!!'
      exit!
    end
  end

  def check_user_input(input)
    case input
    when 'exit'
      @game_over = true
      exit!
    when 'colors'
      puts 'The colors you have to choose from are: red blue green yellow orange pink'
    when 'rules'
      @rules.codebreaker_rules
    else
      check_for_win(@user_input)
      display_feedback(@secret_code, @user_input.split)
      @number_of_guesses -= 1
    end
  end

  def check_for_win(_code)
    if @user_input.split == @secret_code.code
      puts 'You cracked the code!!!! You win!!'
      @game_over = true
      game_ended
    end
  end

  def count_black_pegs(code, guess)
    code.code.zip(guess).collect { |x, y| x == y }.count(true)
  end

  def count_white_pegs(code, guess)
    white_peg = 0
    code_array = []
    guess_array = []

    code.code.zip(guess).collect do |x, y|
      if x != y
        code_array.push(x)
        guess_array.push(y)
      end
    end
    code_array.uniq.each { |word| white_peg += 1 if guess_array.uniq.include? word }

    white_peg
  end

  def display_feedback(code, guess)
    puts '-------------------------------------'
    puts @user_input
    puts "Black pegs: #{count_black_pegs(code, guess)} White pegs: #{count_white_pegs(code, guess)}"
    puts '-------------------------------------'
  end
  # End of Class
end
