# Valid Parentheses
# https://www.codewars.com/kata/52774a314c2333f0a7000688

# Write a function that takes a string of parentheses,
# and determines if the order of the parentheses is valid

def valid_parentheses(string)
  string = string.gsub(/[^\(\)]/, "")

  while string.match?(/\(\)/)
      string = string.sub(/\(\)/, "")
  end

  string.empty? ? true : false
end
