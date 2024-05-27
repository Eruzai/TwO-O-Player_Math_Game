class Player
  attr_accessor :name, :score, :lives

  def initialize(name)
    @name = name
    @score = 0
    @lives = 3
  end

  def increment_score
    self.score += 1
  end

  def remove_life
    self.lives -= 1
  end

  def to_s
    "#{name} has a score of #{score} and has #{lives} lives remaining."
  end
end

player1 = Player.new("Kevin")

puts player1.increment_score
puts player1.remove_life
puts player1