require_relative 'game'

describe Game do

  before do
    @game = Game.new "Knuckleheads"
    @player1 = Player.new "larry"
    @player2 = Player.new "larry"
    @player3 = Player.new "larry"
  end

  describe "#title" do
    it "has a title" do
      expect(@game.title).to eq("Knuckleheads")
    end
  end

  describe "#players" do
    it "is initialize with an array" do
      expect(@game.players).to eq([])
    end
  end

  describe "#players" do
    it "is initialized with an array that's empty" do
      expect(@game.players.size).to eq(0)
    end
  end

  describe "#add_player" do
    it "can add a player to @players" do
      @game.add_player(@player1)
      expect(@game.players.size).to eq(1)
    end
  end

  describe "#play" do
    it "can play the play method" do
      @game.add_player(@player1)
      @game.add_player(@player2)
      @game.add_player(@player3)
      expect(@game.players.size).to eq(3)
    end
  end

end