def find_nearest(n)
  pow = 0
  sum = 1
  while sum <= n
    pow += 1
    sum = 2**pow
  end
  puts "(2^#{pow} = #{sum}) > #{n}"
end

find_nearest(108)
