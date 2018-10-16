# initialize les joueurs
class Player
  attr_accessor :name, :sign
  @@people = []

  def initialize(name, sign)
    @name = name
    @sign = sign
    @@people.push(self)
  end

end
