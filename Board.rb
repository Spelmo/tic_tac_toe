class Board
  attr_accessor :grid

  # crée un tableau array
  def initialize
  @grid = [
    BoardCase.new(0), BoardCase.new(1), BoardCase.new(2),
    BoardCase.new(3), BoardCase.new(4), BoardCase.new(5),
    BoardCase.new(6), BoardCase.new(7), BoardCase.new(8)
  ]
  end

  #affiche le tableau
  def display
    i = 0
    puts "-----------"
    while i < @grid.size
      print "||"
      if @grid[i] == "X"
      	print "#{@grid[i]}".blue
      elsif @grid[i] == "O"
       	print "#{@grid[i]}".purple
      else
      	print "#{@grid[i].case_value}".gray
      end
      if i == 2 || i == 5 || i == 8
        puts '||'
      end
      i += 1
    end
    puts "-----------"
  end

   #marquer une position
   def add_symbol(position, symbol)
     if (@grid[position] == "X" || @grid[position] == "O")
       puts "this position has already been played, try again"
       position = gets.chomp.to_i
     end
     @grid[position] = symbol
   end

  # retourne true si victoire
  def victory()
    if @grid[0] == @grid[1] && @grid[1] == @grid[2] then return true end
    if @grid[3] == @grid[4] && @grid[4] == @grid[5] then return true end
    if @grid[6] == @grid[7] && @grid[7] == @grid[8] then return true end
    if @grid[0] == @grid[3] && @grid[3] == @grid[6] then return true end
    if @grid[1] == @grid[4] && @grid[4] == @grid[7] then return true end
    if @grid[2] == @grid[5] && @grid[5] == @grid[8] then return true end
    if @grid[0] == @grid[4] && @grid[4] == @grid[8] then return true end
    if @grid[2] == @grid[4] && @grid[4] == @grid[6] then return true end

    a=0
    0.upto(8) do |i|
      if @grid[i] == "X" || @grid[i] == "O"
      a += 1
    end
    end
    if a == 9
      puts "Draw!"
      a = 0
    end

  end

end


class BoardCase
attr_accessor :case_value

  def initialize(case_value)
    @case_value = case_value
  end
end
