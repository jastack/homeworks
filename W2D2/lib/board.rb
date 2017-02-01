require 'byebug'

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { [] }
    place_stones
    @current_player = @name1
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    #store_cup at index 6 and 13
    (0..13).each do |i|
      @cups[i].concat([:stone, :stone, :stone, :stone]) unless i == 6 || i == 13
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if !(0..13).cover?(start_pos)
    raise "Invalid starting cup" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    i = (start_pos + 1)
    until @cups[start_pos].empty?
      i = i % 13 if i > 13
      if current_player_name == @name1
        @cups[i] << @cups[start_pos].shift unless i == 13
      else
        @cups[i] << @cups[start_pos].shift unless i == 6
      end
      i += 1 unless @cups[start_pos].empty?
    end
    render
    next_turn(i)
  end

  def next_turn(ending_cup_idx)

    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx - 1].empty?
      :switch
    else
      ending_cup_idx
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
    @cups[0..5].all?(&:empty?) || @cups[7..13].all?(&:empty?)
  end

  def winner
    return :draw if cups[6] == cups[13]
    if cups[6].count > cups[13].count
      return @name1
    else
      return @name2
    end
  end
end
