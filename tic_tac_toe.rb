require_relative 'Player.rb'
require_relative 'Board.rb'
require 'awesome_print'


class Game
  @@turns_number = 0

  def initialize()
    # crée 2 joueurs
    puts "Player 1 what's your name?"
    @player1 = Player.new(gets.chomp, "X")
    puts "#{@player1.name}, your sign is #{@player1.sign.blue}"

    puts "Player 2 what's your name?"
    @player2 = Player.new(gets.chomp, "O")
    puts "#{@player2.name},your sign is #{@player2.sign.purple}"
  end

  def go
      @@table = Board.new
      @@table.display
     	self.turn
  end

  def turn
    @@turns_number = 0
    # boucle tant qu'il n'y a pas victoire
    while (@@table.victory != true) do
      # tours paires: joueur1, tours inpaires joueur2
      if @@turns_number %2 == 0
        puts "#{@player1.name}, what case are you playing?"
        @turn_play = gets.chomp
        # vérifions que l'input est bien un chiffre de 0 à 9
        unless ['0','1','2','3','4','5','6','7','8','9'].include?(@turn_play)
          puts "please enter a valid number"
          @turn_play = gets.chomp
        end
        # transforme la case choisie en X
        @turn_play = @turn_play.to_i
        @@table.add_symbol(@turn_play, "X")
        @@table.display
        if @@table.victory == true then puts "#{@player1.name}, you win!" end

      # même chose pour l'autre joueur
      else
        puts "#{@player2.name}, what case are you playing?"
        @turn_play = gets.chomp
        unless ['0','1','2','3','4','5','6','7','8','9'].include?(@turn_play)
          puts "please enter a valid number"
          @turn_play = gets.chomp
        end
        @turn_play = @turn_play.to_i
        @@table.add_symbol(@turn_play, "O")
        @@table.display
        if @@table.victory == true then puts "#{@player2.name}, you win!" end
      end
      @@turns_number += 1
      break if @@turns_number == 9
    end
    puts "game finished"
  end
end

# boucle pour refaire le jeu indéfiniment si voulu
a = "y"
while a == "y" do
Game.new.go
puts "play again? (y/n)"
a = gets.chomp
end
