class Game 
  def initialize
    @player_1 = Player.new("PLAYER 1")
    @player_2 = Player.new("PLAYER 2")
  end

  def start
    puts "NEW GAME: START. WELCOME #{@player_1.name} AND #{@player_2.name}."
    take_turns
  end

  def show_score
    puts "#{@player_1.name}: #{@player_1.lives}/3 VS. #{@player_2.name}: #{@player_2.lives}/3"
  end

  def winner(player)
    puts "#{player.name} wins with a score of #{player.lives}/3!!!"
    puts "-------- GAME OVER. --------"
    exit(0)
  end

  def check_score
    if @player_1.died
      winner(@player_2)
    elsif @player_2.died
      winner(@player_1)
    end
  end

  def take_turns
    @player_1.new_question
    check_score
    @player_2.new_question
    check_score
    show_score
    puts '---------NEW-TURN---------'
    take_turns
  end

end
