class MathGame
  attr_accessor :current_player, :player1, :player2, :winner

  def initialize
    @current_player = nil
    @player1 = nil
    @player2 = nil
    @winner = nil
  end

  def get_players
    print "Welcome contestants to the Math Quiz!\nWhat are your names?\nPlayer 1 > "
    self.player1 = Player.new(gets.chomp)
    self.current_player = self.player1
    
    
    print "Player 2 > "
    self.player2 = Player.new(gets.chomp)
    
    puts "Welcome #{player1.name} and #{player2.name}!\n#{current_player.name} will recieve the first question!"
  end

  def run_game
    while self.winner == nil
      puts "#{current_player.name}, here is your question!"

      question = Question.new
      
      question.ask_question
      answer = gets.chomp
      puts "#{answer} should equal #{question.sum}"
      
      if answer == question.sum.to_s
        puts "That's correct!"
        self.current_player.increment_score
      else
        puts "Sorry, that's incorrect!"
        self.current_player.remove_life
      end
      
      puts "#{player1}, #{player2}"
      
      if self.current_player == self.player1
        self.current_player = self.player2
      else
        self.current_player = self.player1
      end

      if player1.lives == 0
        puts "#{player1.name} has lost"
        self.winner = player2
      end

      if player2.lives == 0
        puts "#{player2.name} has lost"
        self.winner = player1
      end
    end
  end

  def end_game
    puts "Congratulations #{winner.name}! You claim victory with a score of #{winner.score} and #{winner.lives} lives remaining!"
  end
end
