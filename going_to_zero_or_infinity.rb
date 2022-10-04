# Going to zero or to infinity?
# https://www.codewars.com/kata/55a29405bc7d2efaff00007c

# Calculate (1 / n!) * (1! + 2! + 3! + ... + n!) for a given n,
# where n is an integer greater or equal to 1

def going(n)
  res = 1.0
  temp = 1.0
  for i in (1..(n-1))
    temp = temp / (n - (i-1))
    res += temp
  end
  return res.truncate(6)
end
