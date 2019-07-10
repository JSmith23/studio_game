require_relative 'dye'
require_relative 'player'
module GameTurn

  def self.roll
    dye = Dye.new
    number_rolled = dye.roll
  end

  def self.take_turn(player)
      case roll
      when 1..2
        player.blam
      when 3..4
        puts "#{player.name} was skipped!"
      when 5..6
        player.w00t
      end
    end
  end