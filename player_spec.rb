require_relative 'player'

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
    it "has a string respresentation" do
      player = Player.new "larry", 150

      expect(player.to_s).to eq("I'm Larry with a health of 150 and a score of 155")
    end
  end

  describe "#score" do
    it "computes a score as the sum of its health and length of name" do
      player = Player.new "larry", 150

      expect(player.score).to eq(155)
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

end