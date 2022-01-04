class Player
  attr_accessor :name, :lives

  def initialize(name)
    @name = name
    @lives = 3
  end

  def lose_lives
    @lives -= 1
  end

  def died
    @lives == 0
  end

  def new_question
    new_question = Question.new # for the question class
    new_question.ask_question(name)
    print '> '
    @userinput = $stdin.gets.chomp
    if new_question.check_answer?(@userinput.to_i)
      puts 'CORRECT. YOU LIVE TO SEE ANOTHER DAY.'
    else
      puts 'INCORRECT. YOU MUST PAY WITH YOUR LIFE.'
      lose_lives
    end
  end
end