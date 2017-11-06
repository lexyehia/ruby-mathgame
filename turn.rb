module MathGame
  class Turn
    def initialize active_player
      @number1 = rand(1..50)
      @number2 = rand(1..50)
      @answer = @number1 + @number2
      ask_question(active_player)
    end

    private
    def ask_question(active)
      puts "#{active.id}: What is #{@number1} plus #{@number2}?"
      user_answer = gets.chomp.to_i

      if (user_answer != @answer)
        puts "#{active.id}: INCORRECT! You are the weakest link"
        active.lives -= 1
      else
        puts "#{active.id}: GOOD ANSWER! You keep your lives!"
      end
    end
  end
end
