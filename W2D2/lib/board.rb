require "byebug"

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14)
    self.place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups = @cups.map.with_index do |ele, idx|
      if (idx != 6 && idx != 13)
        [:stone, :stone, :stone, :stone] 
      else
        []
      end
    end
  end

  def valid_move?(start_pos)
    if start_pos < 0 || start_pos > 13
      raise "Invalid starting cup"
      return false
    elsif @cups[start_pos].empty?
      raise "Starting cup is empty"
      return false
    end
    true
  end

  def make_move(start_pos, current_player_name)
    if valid_move?(start_pos)
      @current_player_name = current_player_name
      current_pos = start_pos + 1
      @cups[start_pos].each do
        fill_idx = current_pos % cups.length
        if (current_player_name == @name1 && fill_idx == 13) || 
           (current_player_name == @name2 && fill_idx == 6)
          current_pos += 1
          fill_idx = current_pos % cups.length
        end
        @cups[fill_idx] << :stone
        current_pos += 1
      end
      @cups[start_pos] = []
      self.render
      return self.next_turn(current_pos-1)
    end
  end

  def next_turn(ending_cup_idx)
    ending_cup_idx = ending_cup_idx % @cups.length
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if (@current_player_name == @name1 && ending_cup_idx == 6) || 
      (@current_player_name == @name2 && ending_cup_idx == 13)
      return :prompt
    elsif cups[ending_cup_idx].length <= 1
      return :switch
    else
      return ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0...6].all? {|ele| ele.empty?} || 
    @cups[7...13].all? {|ele| ele.empty?}
  end

  def winner
      if @cups[6].length == @cups[13].length
        return :draw
      elsif @cups[6].length > @cups[13].length
        return @name1
      else
        @name2
      end
  end
end
