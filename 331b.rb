def nearest(n)
  answers = []
  (0..Math.sqrt(n)).each do |x|
    (0..Math.sqrt(n)).each do |y|
      (0..Math.sqrt(n)).each do |z|
        sum = 2**x + 2**y + 2**z
        answers << Hash[:x, x, :y, y, :z, z, :sum, sum] if sum == n
      end
    end
  end
  answers
end

puts nearest(12)
