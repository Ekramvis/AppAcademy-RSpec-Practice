class Game
  attr_accessor :pegs

  def initialize
    @pegs = [[3,2,1],[],[]]
  end

  def display
    @pegs
  end

  def win?
    @pegs == [[],[],[3,2,1]]
  end

  def move(start, finish)
    if valid_move?(start, finish)
      moving = @pegs[start].pop
      @pegs[finish] << moving
    end
  end

  def valid_move?(start, finish)
    return true if @pegs[finish].empty?
    if @pegs[start].last > @pegs[finish].last
      raise StandardError.new("Can't move larger discs onto smaller ones")
    end

    true
  end

end