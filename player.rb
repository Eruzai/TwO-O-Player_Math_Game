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
    "#{name} has #{score} pts and #{lives} lives"
  end
end
