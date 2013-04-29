require 'rspec'
require 'hanoi'

describe Game do
  subject(:game) {Game.new}

  describe "#pegs" do
    it "should initialize a starting game" do
      game.pegs.should == [[3,2,1],[],[]]
    end

  end

  describe "#display" do
    it "displays the board" do
      game.pegs = [[2,1],[],[3]]
      game.display.should == [[2,1],[],[3]]
    end
  end

  describe "#win?" do
    it "returns true when the game is won" do
      game.pegs = [[],[],[3,2,1]]
      game.win?.should be_true
    end

    it "returns false when the game is incomplete" do
      game.win?.should be_false
    end
  end

  describe "#move" do
    it "it moves a disc onto empty" do
      game.move(0,2)
      game.pegs.should == [[3,2],[],[1]]
    end

    it "moves a disc onto larger discs" do
      game.pegs = [[3,2],[],[1]]
      game.move(2,0)
      game.pegs[0].should == [3,2,1]
    end

    it "raises an exception if illegal move" do
      expect {game.pegs = [[3,2],[],[1]]
      game.move(0,2)}.to raise_error("Can't move larger discs onto smaller ones")
    end
  end

  describe "#valid_move?" do
    it "returns true if destination is larger than start" do
      game.pegs = [[3,2],[],[1]]
      game.valid_move?(2,0).should be_true
    end

    it "raises an exception when destination is smaller than start" do
      expect {game.pegs = [[3,2],[],[1]]
      game.valid_move?(0,2)}.to raise_error("Can't move larger discs onto smaller ones")
    end

    it "allows a move to empty" do
      game.pegs = [[3,2],[],[1]]
      game.valid_move?(2,1).should be_true
    end
  end
end
