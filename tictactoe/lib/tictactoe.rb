# use 'ruby tictactoe.rb' to run
class TicTacToe
  EMPTY_BOARD = (1..9).to_a
  CONDITIONS = [
    [1,2,3], [4,5,6], [7,8,9], 
    [1,4,7], [2,5,8], [3,6,9], 
    [1,5,9], [3,5,7]
  ]
  
  def initialize
    @board = Array.new(9, ' ')
    @player1_choice = []
    @player2_choice = []
  end

  def start_game
    show_board(EMPTY_BOARD)
    @game_over = false
    @userturn = 'X'
    play_game
  end

  def show_board(type)
    puts type[0..2].join(' | ')
    puts '---------'
    puts type[3..5].join(' | ')
    puts '---------'
    puts type[6..8].join(' | ')
    puts
  end

  def get_user_input_position
    raw_input = gets.chomp.to_i
    while raw_input < 1 || raw_input > 9
      raw_input = gets.chomp.to_i
    end
    @userinput = raw_input - 1
  end

  def put_piece_on_board(board, position, piece)
    if board[position] == ' '
      return board[position] = piece
    else
      puts 'Invalid Move'
      switch_turn
      return false
    end
  end

  def play_game
    until @game_over == true
      puts (@userturn + "'s Turn")
      get_user_input_position #index of the board
      if put_piece_on_board(@board, @userinput, @userturn) != false #put X or O on the board if it's empty space
        keep_player_choices(@player1_choice, 'X') # put player position choices in an array
        keep_player_choices(@player2_choice, 'O')
      end
      show_board(@board)
      check_game_over(@player1_choice)
      check_game_over(@player2_choice)
      switch_turn
    end
  end

  def keep_player_choices(player_choice, player)
    player_choice << @userinput + 1 if @userturn == player
  end

  def switch_turn
    @userturn = @userturn == 'X' ? 'O' : 'X'
  end

  def check_game_over(choice)
    if choice.size >= 3
      CONDITIONS.each_index do |index|
        if CONDITIONS[index] & choice.sort == CONDITIONS[index]
          puts ('GAME OVER, ' + @userturn.to_s + ' Wins!')
          reset
          return true
        end
      end
    tie?(@board)
    end
    return false
  end

  def tie?(board)
    if board.all? { |x| x != ' ' }
      puts "It's a TIE"
      reset
      true
    else
      false
    end
  end

  def continue?
    puts "Play Again? (y/n)"
    continue = gets.chomp
    while continue != 'y' && continue != 'n'
      continue = gets.chomp
    end
    if continue == 'y'
      show_board(@board)
      play_game
    elsif continue == 'n'
      exit
    end
  end

  def reset
    @board = Array.new(9,' ')
    @player1_choice = []
    @player2_choice = []
    @game_over = false
    continue?
  end
end

mygame = TicTacToe.new
mygame.start_game