# Smallest possible sum
# https://www.codewars.com/kata/52f677797c461daaf7000740

# Given an array X of positive integers, its elements are to be transformed
# by running the following operation on them as many times as required:
# if X[i] > X[j] then X[i] = X[i] - X[j]
# When no more transformations are possible, return its sum ("smallest possible sum").

def solution(numbers)
  min = numbers.min
  size = numbers.size
  divs = Set[]
  for n in numbers-[min]
    if min.gcd(n) == 1
      return size
    else
      divs.add(min.gcd(n))
    end
  end
  puts divs
  if !divs.empty?
    return divs.min.to_i * size
  else
    return min*size
  end
end
