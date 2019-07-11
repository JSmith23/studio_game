require_relative 'treasure_trove'

class Player
  attr_reader :health
  attr_accessor :name
  def initialize(name,health=100)
    @name = name.capitalize
    @health = health
    @found_treasures = Hash.new(0)
  end

  def to_s
    "I'm #{@name} with health = #{@health}, points = #{points}, and score = #{score}."
  end

  def each_found_treasure
    @found_treasures.each do |name, points|
      yield Treasure.new(name, points)
    end
  end

  def found_treasure(treasure)
    if @found_treasures[treasure.name]
      @found_treasures[treasure.name] += treasure.points
    else
      @found_treasures[treasure.name] += treasure.points
    end
    puts "#{@name} found a #{treasure.name} worth #{treasure.points} points."
    puts "#{@name}'s treasures: #{@found_treasures}"
  end

  def points
    @found_treasures.values.reduce(0, :+)
  end

  def <=>(other)
    other.score <=> score
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
    @health + points
  end

  def strong?
    if @health >= 150
      true
    else
      false
    end
  end
end