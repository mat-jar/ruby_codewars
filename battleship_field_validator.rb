# Battleship field validator
# https://www.codewars.com/kata/52bb6539a4cf1b12d90005b7

# Write a method that takes a field for well-known board game "Battleship" as an argument
# and returns true if it has a valid disposition of ships, false otherwise

def validate_battlefield(field)
    number_size_1 = 0
    field.each_index do |row|
      field[row].each_index do |column|
        if field[row][column] == 1
          if !check_diagonal(field, row, column)
            return false
          end
          number_size_1 += add_size_1(field, row, column)
        end
      end
    end
  if number_size_1 !=4
    return false
  end
  if !check_long_ships(field)
    return false
  end
  return true

end

def add_size_1(field, row, column)
  around = {:left => 0, :right => 0, :top => 0, :bottom => 0}
  if row-1>=0
    if field[row-1][column] == 1
      around[:top] = 1
    end
  end
  if field[row+1]
    if field[row+1][column] == 1
      around[:bottom] = 1
    end
  end
  if field[row][column+1] == 1
    around[:right] = 1
  end
  if column-1>=0
    if field[row][column-1] == 1
      around[:left] = 1
    end
  end
  if around == {:left => 0, :right => 0, :top => 0, :bottom => 0}
    return 1
  else
    return 0
  end
end

def check_long_ships(field)
  ships = {2 => 0, 3 => 0, 4 => 0}
  field.each do |row|
    row.join.scan(/[1][1]+/).each do |ship|
      if ship.length > 4
        return false
      else
        ships[ship.length] += 1
      end
    end
  end

  field.transpose.each do |column|
    column.join.scan(/[1][1]+/).each do |ship|
      if ship.length > 4
        return false
      else
        ships[ship.length] += 1
      end
    end
  end
  if ships != {2=>3, 3=>2, 4=>1}
    return false
  end
  return true
end

def check_diagonal(field, row, column)
  if column-1>=0 && row-1>=0
    if field[row-1][column-1] == 1
      return false
    end
  end

  if row-1>=0
    if field[row-1][column+1] == 1
      return false
    end
  end

  if column-1>=0 && field[row+1]
    if field[row+1][column-1] == 1
      return false
    end
  end

  if field[row+1]
    if field[row+1][column+1] == 1
      return false
    end
  end
  return true
end
