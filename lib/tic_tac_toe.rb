class TicTacToe
  
    attr_accessor :board
  
    
    def initialize
      @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
      
    end
    
    WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]  
  
  def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
    
   def input_to_index(input)
      input.to_i - 1
    end
    
    def move(index, token = "X")
      @board[index] = token
    end
  
  def position_taken?(index)
      @board[index] != " " && @board[index] != ""
    end
  
   def valid_move?(index)
      index.between?(0,8) && !position_taken?(index)
    end
    
    def turn_count
      @board.count{|token| token == "X" || token == "O"}
    end
    
    def turn
      puts "Please enter 1-9:"
      input = gets.strip
      index = input_to_index(input)
        if valid_move?(index)
          move(index, current_player)
        elsif
          input=gets.strip
        end
      display_board 
    end
    
    def current_player 
      if turn_count.even?
        "X"
        else 
        "O"
      end
    end
    
    def won?
      WIN_COMBINATIONS.any? do |combo|
        if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
          return combo
        end
      end
    end
    
    def full?
      @board.all? do |token|
        token == "X" || token == "O"
      end
    end
  
    def draw?
      !won? && full?
    end
  
    def over?
      won? || draw?
    end
  
    def winner
      if winning_combo = won?
        @board[winning_combo.first]
      end
    end
    
    def play
      turn until over?
      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
      end
    end
    
  end