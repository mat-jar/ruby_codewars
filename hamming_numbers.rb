# Hamming Numbers
# https://www.codewars.com/kata/526d84b98f428f14a60008da

# A Hamming number is a positive integer of the form (2**i)*(3**j)*(5**k),
# for some non-negative integers i, j, and k.
# Write a function that computes the nth smallest Hamming number.

def hamming(n)
  h=[]
  h[0]=1
  array = [[2,0,0], [3,0,0],[5,0,0]]
  while h.length < n
    (temp = array.min_by {|el| el[2] = h[el[1]]*el[0]})[1] += 1
    if temp[2] != h.last
      h.push(temp[2])
    end
  end
  h.last

end
