require "./player.rb"

class Game

  attr_accessor :players, :turn

  def initialize
    @turn = 1
    @players = [Player.new(1), Player.new(2)]
  end

  def start
    new_turn
  end

  private

  def new_turn
    puts "----- NEW TURN -----"

    active = @players.shift
    ask_question(active)
    @players << active

    if (game_over?)
      puts victory_message
      puts "----- GAME OVER -----"
    else
      puts player_lives
      new_turn
    end
  end

  def ask_question(active)

    number1 = rand(1..50)
    number2 = rand(1..50)
    answer = number1 + number2

    puts "#{active.id}: What is #{number1} plus #{number2}?"
    user_answer = gets.chomp.to_i

    if (user_answer != answer)
      puts "#{active.id}: INCORRECT! You are the weakest link"
      active.lives -= 1
    else
      puts "#{active.id}: GOOD ANSWER! You keep your lives!"
    end
  end

  def game_over?
    dead_players = @players.select { |pl| pl.lives == 0 }
    dead_players.size > 0
  end

  def player_lives
    "P1: #{@players[0].lives}/3 vs P2: #{@players[1].lives}/3"
  end

  def victory_message
    winners = @players.select { |p| p.lives > 0 }
    "#{winners[0].id} wins with a score of #{winners[0].lives}/3"
  end
end
