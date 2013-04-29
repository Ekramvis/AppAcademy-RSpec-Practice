require 'rspec'
require 'treenode'


describe TreeNode do
  subject(:root) do
    root = TreeNode.new(10)
    c1 = TreeNode.new(3)
    root.add_child(c1)
    c2 = TreeNode.new(6)
    root.add_child(c2)
    gc1 = TreeNode.new(12)
    c1.add_child(gc1)
    gc3 = TreeNode.new(30)
    c2.add_child(gc3)
    gc2 = TreeNode.new(20)
    c1.add_child(gc2)
    root
  end

  describe "#initialize" do
    let(:root) {TreeNode.new(10)}
    it "initializes with a value and parent = nil" do
      root.value.should == 10
      root.parent.should be_nil
    end

    it "initializes children as an empty array" do
      root.children.should be_empty
    end
  end

  describe "#add_child(child)" do
    let(:root) {TreeNode.new(10)}
    let(:c) {TreeNode.new(2)}

    it "adds a child to the @children" do
      root.add_child(c)
      root.children.size.should == 1
    end

    it "sets child's parent to self" do
      root.add_child(c)
      c.parent.should == root
    end
  end

  describe "#dfs(target)" do

    it "returns self if target matches its value" do
      root.dfs(10).should == root
    end

    it "returns nil if it has no children and doesn't match" do
      t = TreeNode.new(100)
      t.dfs(5).should be_nil
    end

    it "calls itself recursively on a child in correct order" do
      root.should_receive(:value).ordered
      root.children[0].should_receive(:value).ordered
      root.children[0].children[0].should_receive(:value).ordered
      root.children[0].children[1].should_receive(:value).ordered
      root.dfs(20)
    end

  end


end