class Question
  attr_reader :num1, :num2, :sum

  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @sum = self.num1 + self.num2
  end

  def ask_question
    print "what is the sum of #{num1} + #{num2}?\n> "
  end
end
