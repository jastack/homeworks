class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    turn = require_sequence
    round_success_message
    @sequence_length += 1
    if turn == seq
      add_random_color
    else
      game_over_message
    end
  end

  def show_sequence
    p seq
    add_random_color
  end

  def require_sequence
    gets.chomp.split(" ")
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    p "Great success!"
  end

  def game_over_message
    p "You lost. Try again."
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
