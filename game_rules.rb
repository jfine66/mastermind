# Holds all Game rules
class GameRules
  def initialize; end

  def basic_rules
    puts 'Welcome to Mastermind. A simple code breaking game. You can choose if you want to be the codebreaker or
    if you want to be the codemaker. The codebreaker tries to break a random code the computer makes. The code maker tries to make
    a code that the computer cannot break. Would you like to be the codebreaker or codemaker?' 
  end

  def codebreaker_rules
    puts "The rules are simple. The computer will generate a secret code made up of four colors.
  Example 'blue red green green' The colors can duplicate so watch out.
  The colors you can choose from are: red blue green yellow orange pink : if you forget you can simply type the word
  'colors' and they will be displayed again. Simply type your guess in all lowercase and seperated by a SINGLE SPACE.
  If you guess the right color and in the right position you will be awared a black peg. If you guess the right
  color but in the wrong position you will be awarded a white peg. Use this information to help you crack the code.
  Good luck. If you need a refersher on the rules simply type 'rules'
  If you want to quit simple type 'exit' "
  end

  def codemaker_rules
    puts "Welcome code maker. The rules are simple. Simply make a four color code and see if the computer can crack it or not.
    The computer will have twelve guesses to crack your code. If it can't you win.
    The colors you have to choose from are: red blue green yellow orange pink : duplicates are allowed. See if you can stump the computer!"
  end
end

# Used to create a code for game
class SecretCode
  attr_reader :code

  def initialize
    @color_choices = %w[red blue green yellow orange pink]
    @code = Array.new(4) { @color_choices.sample }
  end
end