class Array

  def my_uniq
    return self if self.empty?

    res = []
    self.each do |el|
      res << el unless res.include?(el)
    end

    res
  end

  def two_sum
    self.size.times do |i|
      self.size.times do |j|
        next if j <= i
        return true if self[i] + self[j] == 0
      end
    end

    false
  end

  def my_transpose
    res = Array.new(self[0].size) {[]}

    self[0].size.times do |i|
      self.size.times do |j|
        res[i][j] = self[j][i]
      end
    end

    res
  end

  def stock_picker
    days = []
    max_sale = 0

    self.each_with_index do |price1, day1|
      self.each_with_index do |price2, day2|
        next if day2 <= day1
        if price2 - price1 > max_sale
          max_sale = price2 - price1
          days[0] = day1
          days[1] = day2
        end
      end
    end

    days
  end

end






