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

end