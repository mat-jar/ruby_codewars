# Last digit of a large number
# https://www.codewars.com/kata/5511b2f550906349a70004e1

# Define a function that takes in two non-negative integers a and b
# and returns the last decimal digit of a**b

def last_digit(n1, n2)
  return 1 if n2 == 0
  case n1.digits.first
  when 0
    return 0
  when 1
      return 1
  when 2
    case n2 % 4
      when 1
        return 2
      when 2
        return 4
      when 3
        return 8
      when 0
        return 6
      end
  when 3
    case n2 % 4
      when 1
        return 3
      when 2
        return 9
      when 3
       return 7
      when 0
        return 1
      end
  when 4
    if n2 % 2 == 1
      return 4
    else
      return 6
    end
  when 5
    return 5
  when 6
    return 6
  when 7
    case n2 % 4
      when 1
        return 7
      when 2
        return 9
      when 3
        return 3
      when 0
        return 1
      end
  when 8
    case n2 % 4
        when 1
          return 8
        when 2
          return 4
        when 3
          return 2
      when 0
          return 6
      end

  when 9
    if n2 % 2 == 1
      return 9
    else
      return 1
    end
  end

end
