
class CodeMaker
  def initialize
    @game_over = false
    @number_of_guesses = 12
    @secret_code = SecretCode.new
    @rules = Rules.new
  end
end

