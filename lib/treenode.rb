class TreeNode
  attr_accessor :value, :parent, :children

  def initialize(value, parent=nil)
    @value = value
    @parent = parent
    @children = []
  end

  def add_child(child)
    @children << child
    child.parent = self
  end

  def dfs(target)
    return self if self.value == target

    @children.each do |child|
      next if child.nil?
      result = child.dfs(target)
      return result if result
    end

    nil
  end

  def bfs(target)
    queue = [self]

    until queue.empty?
      test = queue.shift
      if test.value == target
        return test
      else
        test.children.each do |child|
          queue << child
        end
      end
    end

    nil
  end

end