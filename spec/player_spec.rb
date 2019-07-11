require_relative '../player'
require_relative '../treasure_trove'
require 'pry'

describe Player do
  before do
    @player = Player.new "larry", 150
  end

  describe "name" do
    it "has a capitalized name" do
      player = Player.new "larry", 150
      expect(player.name).to eq "Larry"
    end
  end

  describe "health" do
    it "has an initial health" do
      player = Player.new "larry"
      expect(player.health).to eq 100
    end
  end

  describe "#to_s" do
    it "has a string representation" do
      @player.found_treasure(Treasure.new(:hammer, 50))
      @player.found_treasure(Treasure.new(:hammer, 50))
      expect(@player.to_s).to eq("I'm Larry with health = 150, points = 100, and score = 250.")
    end
  end

  describe "#score" do
    it "computes a score as the sum of its health and points" do
      @player.found_treasure(Treasure.new(:hammer, 50))
      @player.found_treasure(Treasure.new(:hammer, 50))
      expect(@player.score).to eq(250)
    end
  end

  describe "#w00t" do
    it "increases health by 15 when w00ted" do
      player = Player.new "larry", 150

      player.w00t
      expect(player.health).to eq(165)
    end
  end


  describe "#blam" do
    it "decreases health by 10 when blammed" do
      player = Player.new "larry", 150

      player.blam
      expect(player.health).to eq(140)
    end
  end

  context "a player has an initial health of 150" do
    describe "#strong?" do
      it "checks to see if a player is strong" do
        expect(@player.strong?).to eq(true)
      end
    end
  end

  context "a player has an initial health of 100" do
    describe "#strong?" do
      it "checks to see if a player is strong" do
        player2 = Player.new 'moe'
        expect(player2.strong?).to eq(false)
      end
    end
  end

  context "in a collection of players" do
    before do
      @player1 = Player.new("moe", 100)
      @player2 = Player.new("larry", 200)
      @player3 = Player.new("curly", 300)

      @players = [@player1, @player2, @player3]
    end

    it "is sorted by decreasing score" do
      @players.sort.should == [@player3, @player2, @player1]
    end
  end

  it "computes points as the sum of all treasure points" do
    expect(@player.points).to eq(0)
    @player.found_treasure(Treasure.new(:hammer, 50))
    expect(@player.points).to eq(50)
    @player.found_treasure(Treasure.new(:crowbar, 400))
    expect(@player.points).to eq(450)
    @player.found_treasure(Treasure.new(:hammer, 50))
    expect(@player.points).to eq(500)
  end

  it "yields each found treasure and its total points" do
    @player.found_treasure(Treasure.new(:skillet, 100))
    @player.found_treasure(Treasure.new(:skillet, 100))
    @player.found_treasure(Treasure.new(:hammer, 50))
    @player.found_treasure(Treasure.new(:bottle, 5))
    @player.found_treasure(Treasure.new(:bottle, 5))
    @player.found_treasure(Treasure.new(:bottle, 5))
    @player.found_treasure(Treasure.new(:bottle, 5))
    @player.found_treasure(Treasure.new(:bottle, 5))

    yielded = []
    @player.each_found_treasure do |treasure|
      yielded << treasure
    end

    yielded.should == [
      Treasure.new(:skillet, 200),
      Treasure.new(:hammer, 50),
      Treasure.new(:bottle, 25)
  ]
  end

end