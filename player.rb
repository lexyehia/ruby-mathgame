class Player
  attr_accessor :lives, :id

  def initialize(id)
    @id = "Player #{id}"
    @lives = 3
  end

end
