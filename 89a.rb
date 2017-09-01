def nod(m, n)
  return m if m == n

  m, n = n, m if m < n

  return n if (m % n).zero?

  nod(n, m % n)
end

puts nod(30, 18)
