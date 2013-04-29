require "rspec"
require "array"


describe Array do

  describe "#my_uniq" do
    it "returns an empty array if it's empty" do
      [].my_uniq.should == []
    end

    it "returns uniques if an array has identicals" do
      [1,2,3,1].my_uniq.should == [1,2,3]
    end

  end

  describe "#two_sum" do
    it "returns false if no pairs sum to zero" do
      [1,2,3].two_sum.should be_false
    end

    it "returns true if it finds a pair that sums to zero" do
      [1,2,3,-1].two_sum.should be_true
    end
  end

  describe "#my_transpose" do
    it "transposes a single row into columns" do
      [[1,2,3]].my_transpose.should == [[1],[2],[3]]
    end

    it "transposes multiple rows into columns" do
      [[1,2,3],[1,2,3],[1,2,3]].my_transpose.should == [[1,1,1],[2,2,2],[3,3,3]]
    end

    it "transposes uneven rows into columns" do
      [[1,2,3,4],[1,2,3,4]].my_transpose.should == [[1,1],[2,2],[3,3],[4,4]]
    end
  end

  describe "#stock_picker" do
    it "returns nil if no profitable pairs exist" do
      [5,4,3,2,1].stock_picker.should == []
    end

    it "returns a pair of days" do
      [1,2,3,4,5].stock_picker.size.should == 2
    end

    it "returns the correct pair of days when profit" do
      [3,0,6,1,8,4,9].stock_picker.should == [1,6]
    end
  end
end






















