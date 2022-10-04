# What's a Perfect Power anyway?
# https://www.codewars.com/kata/54d4c8b08776e4ad92000835

# Your task is to check wheter a given integer is a perfect power

require "prime"
def isPP(n)
  for i in (1..(Integer.sqrt(n))).select { |k| n % k == 0 }
    for j in Prime.each(Math.log(n, 2))
      if i**j == n
        output=[i,j]
        break
      end
    end
  end
  return output
end
