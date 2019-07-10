require_relative '../game'
require_relative '../dye'
require 'pry'

describe Game do

  before do
    @game = Game.new "Knuckleheads"
    @player1 = Player.new "larry"
    @player2 = Player.new "moe", 150
    @player3 = Player.new "curly", 120
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

    it "w00ts a player when a high number is rolled" do
      allow_any_instance_of(Dye).to receive(:roll).and_return(5)
      @game.add_player(@player1)
      @game.add_player(@player2)
      @game.add_player(@player3)
      @game.play
      expect(@player1.health).to eq(115)
    end

    it "skips a player when a medium number is rolled" do
      allow_any_instance_of(Dye).to receive(:roll).and_return(3)
      @game.add_player(@player1)
      @game.add_player(@player2)
      @game.add_player(@player3)
      @game.play
      expect(@player1.health).to eq(100)
    end

    it "blams a player when a low number is rolled" do
      allow_any_instance_of(Dye).to receive(:roll).and_return(1)
      @game.add_player(@player1)
      @game.add_player(@player2)
      @game.add_player(@player3)
      @game.play
      expect(@player1.health).to eq(90)
    end
  end


end