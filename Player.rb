class Player
  attr_accessor :name, :sign
#  attr_writer  :won
  @@people = []

  def initialize(name, sign)
    @name = name
    @sign = sign
  #  @won = "Playing"
    @@people.push(self)
  end

end
