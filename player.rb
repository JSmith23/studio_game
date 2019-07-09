class Player
  attr_reader :health
  attr_accessor :name
  def initialize(name,health=100)
    @name = name.capitalize
    @health = health
  end

  def to_s
    "I'm #{@name} with a health of #{@health} and a score of #{score}"
  end

  def w00t
    @health += 15
    puts "#{@name} has been w00ted!"
  end

  def blam
    @health -= 10
    puts "#{@name} has been blammed!"
  end

  def score
    @health + @name.length
  end
end