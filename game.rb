class MathGame
  attr_accessor :current_player, :player1, :player2, :winner

  def initialize
    @current_player = nil
    @player1 = nil
    @player2 = nil
    @winner = nil
  end

  def get_players
    print "----- GREET PLAYERS -----\n\nWelcome contestants to the Math Quiz!\nWhat are your names?\n\nPlayer 1 > "
    self.player1 = Player.new(gets.chomp)
    self.current_player = self.player1
    
    
    print "\nPlayer 2 > "
    self.player2 = Player.new(gets.chomp)
    
    puts "\nWelcome #{player1.name} and #{player2.name}!\n\n#{current_player.name} will recieve the first question!\n\n----- LET'S BEGIN! -----\n\n"
  end

  def run_game
    while self.winner == nil
      puts "\n----- #{current_player.name}'s TURN -----\n\n#{current_player.name}, here is your question!\n"

      question = Question.new
      
      question.ask_question
      answer = gets.chomp
      
      if answer == question.sum.to_s
        puts "\n----- RESULTS -----\n\nThat's correct!\n\n"
        self.current_player.increment_score
      else
        puts "\n----- RESULTS -----\n\nSorry, that's incorrect! The correct answer was #{question.sum}.\n\n"
        self.current_player.remove_life
      end
      
      puts "#{player1}, #{player2}"
      
      if !player1.alive?
        puts "\n----- THE GAME IS OVER -----\n\n#{current_player.name} has lost!\n\n"
        self.winner = player2
      end
      
      if !player2.alive?
        puts "\n----- THE GAME IS OVER -----\n\n#{current_player.name} has lost!\n\n"
        self.winner = player1
      end

      if self.current_player == self.player1
        self.current_player = self.player2
      else
        self.current_player = self.player1
      end
    end
  end

  def end_game
    puts "Congratulations #{winner.name}! You claim victory with a score of #{winner.score} and #{winner.lives} lives remaining!\n\n----- GAME TERMINATED -----"
  end
end
