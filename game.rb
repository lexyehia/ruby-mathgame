require "./player.rb"
require "./turn.rb"

module MathGame
  class Game

    attr_accessor :players, :turn

    def initialize
      @turn = 1
      @players = [Player.new(1), Player.new(2)]
      new_turn
    end

    private

    def new_turn
      puts "----- NEW TURN -----"

      active = @players.shift
      Turn.new(active)
      @players << active

      if (game_over?)
        puts victory_message
        puts "----- GAME OVER -----"
      else
        puts player_lives
        new_turn
      end
    end

    def game_over?
      dead_players = @players.select { |pl| pl.lives == 0 }
      dead_players.size > 0
    end

    def player_lives
      "P1: #{@players[0].lives}/3 vs P2: #{@players[1].lives}/3 \n\n"
    end

    def victory_message
      winners = @players.select { |p| p.lives > 0 }
      "#{winners[0].id} wins with a score of #{winners[0].lives}/3 \n\n"
    end
  end
end
