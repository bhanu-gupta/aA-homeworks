class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over
      self.take_turn
    end
    self.game_over_message
    self.reset_game
  end

  def take_turn
    self.show_sequence
    sleep(1)
    self.require_sequence
    if @game_over == false
      self.round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    self.add_random_color
    p @seq
  end

  def require_sequence
    system("clear")
    puts "Enter the sequence"
    user_seq = gets.chomp.split(",")
    if user_seq != @seq
      @game_over = true
    end
  end

  def add_random_color
    options = Simon::COLORS
    rand_color = options.sample
    @seq << rand_color
  end

  def round_success_message
    puts "You won this round"
  end

  def game_over_message
    puts "You entered a wrong sequence. Game Over!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

sim = Simon.new
sim.play