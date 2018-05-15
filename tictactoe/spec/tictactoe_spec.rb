#some elements in the code file must be disabled to test these methods
require 'tictactoe'
describe TicTacToe do

  describe '.put_piece_on_board' do

    let (:game) { TicTacToe.new }
    let (:board) { [" ", " ", " ", "X", " ", " ", " ", " ", " "] }

    context 'when the position is not empty' do
      it 'returns false' do
        expect(game.put_piece_on_board(board, 3, 'O')).to eql false
      end
    end
    context 'when position is empty' do
      it 'returns the piece' do
        expect(game.put_piece_on_board(board, 4, 'X')).to eql('X')
      end
    end
  end

  describe '.check_game_over' do

    let (:game) { TicTacToe.new }
    let (:choice) { {"horizontal" => [1,2,3], "vertical" => [2,5,8], 
                      "crossing" => [1,5,9], "mixed" => [1,4,9,5,7],
                      "no_winning" => [1,9,4,8,6]} }

    context 'when 3 pieces in a row' do
      it "returns true" do
        expect(game.check_game_over(choice["horizontal"])).to eql true
      end
    end

    context 'when 3 pieces in a column' do
      it "returns true" do
        expect(game.check_game_over(choice["vertical"])).to eql true
      end
    end

    context 'when 3 pieces across the board' do
      it "returns true" do
        expect(game.check_game_over(choice["crossing"])).to eql true
      end
    end

    context "when mixed pieces with winning condition" do
      it "returns true" do
        expect(game.check_game_over(choice["mixed"])).to eql true
      end
    end

    context "when mixed pieces with no winning condition" do
      it "returns false" do
        expect(game.check_game_over(choice["no_winning"])).to eql false
      end
    end
  end

  describe ".tie?" do

    let (:game) { TicTacToe.new }
    let (:board) { {"fullboard" => %w[O X X X X O O O X], 
                    "not_full" => ["O", "X", "X", " ", "X", "O", "O", "O", "X"]} }

    context "when the board is full" do
      it "returns true" do
        expect(game.tie?(board["fullboard"])).to eql(true)
      end
    end

    context "when board is not full" do
      it "returns false" do
        expect(game.tie?(board["not_full"])).to eql(false)
      end
    end
  end
end