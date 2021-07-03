# frozen_string_literal: true

# Used to create a code for game
class SecretCode
  attr_reader :code

  def initialize
    @color_choices = %w[red blue green yellow orange pink]
    @code = Array.new(4) { @color_choices.sample }
  end
end

# Explains the code breaking rules
class Rules
  def initialize; end

  def explain_rules
    puts "The rules are simple. The computer will generate a secret code made up of four colors.
  Example 'blue red green green' The colors can duplicate so watch out.
  The colors you can choose from are: red blue green yellow orange pink : if you forget you can simply type the word
  'colors' and they will be displayed again. Simply type your guess in all lowercase and seperated by a SINGLE SPACE.
  If you guess the right color and in the right position you will be awared a black peg. If you guess the right
  color but in the wrong position you will be awarded a white peg. Use this information to help you crack the code.
  Good luck. If you need a refersher on the rules simply type 'rules'
  If you want to quit simple type 'exit' "
  end
end

# Logic for player to break the code
class CodeBreaker
  def initialize
    @game_over = false
    @number_of_guesses = 12
    @secret_code = SecretCode.new
    @rules = Rules.new
  end

  def game_start
    @rules.explain_rules

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
      rules.explain_rules
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
