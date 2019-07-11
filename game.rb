require_relative 'player'
require_relative 'dye'
require_relative 'game_turn'
require_relative 'treasure_trove'
require 'pry'

class Game
  attr_reader :title, :players
  def initialize(title)
    @title = title
    @players = []
  end

  def add_player(player)
    @players << player
  end

  def play(rounds)
    puts "There are #{TreasureTrove::TREASURES.size} treasures to be found:"
    TreasureTrove::TREASURES.each do |treasure|
      puts "A #{treasure.name} is worth #{treasure.points} points."
    end
    puts "\nThere are #{@players.size} players in #{@title}"
    puts players
    1.upto(rounds) do |round|
      puts "\nRound #{round}:"
      @players.each do |player|
      GameTurn.take_turn(player)
        puts player
      end
    end
  end

  def print_stats
    strong_players, wimpy_players = @players.partition do |player|
      player.strong?
    end

    puts "\n#{@title} Statistics:"

    puts "\n#{strong_players.size} strong players:"
    strong_players.each do |player|
      puts "#{player.name} (#{player.health})"
    end

    puts "\n#{wimpy_players.size} wimpy players:"
    wimpy_players.each do |player|
      puts "#{player.name} (#{player.health})"
    end

    puts "\n#{@title} High Scores:"
    sorted_players = @players.sort do |player1,player2|
      player2.score <=> player1.score
    end

    @players.sort.each do |player|
      puts "#{player.name.ljust(10, '.')}#{player.score}"
    end

    @players.each do |player|
      puts "\n#{player.name}'s point totals:"
      puts "#{player.points} grand total points"
    end
  end

  # @players.sort.each do |player|
  #   puts "\n#{player.name}'s point totals:"
  #   player.each_found_treasure do |treasure|
  #     puts "#{treasure.points} total #{treasure.name} points"
  #   end
  #   puts "#{player.points} grand total points"
  # end

end