class MathGame
  attr_accessor :current_player, :player1, :player2

  def initialize
    current_player = nil
    player1 = nil
    player2 = nil
  end

  def get_players
    print "Welcome contestants to the Math Quiz!\nWhat are your names?\nPlayer 1 > "
    self.player1 = Player.new(gets.chomp)
    self.current_player = self.player1.name
    
    
    print "Player 2 > "
    self.player2 = Player.new(gets.chomp)
    
    puts "Welcome #{player1.name} and #{player2.name}!\n#{current_player} will recieve the first question!"
  end

  def begin_game
    
  end

  def end_game
  end
end
