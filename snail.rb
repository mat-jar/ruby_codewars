# Snail
# https://www.codewars.com/kata/521c2db8ddc89b9b7a0000c1

# Given an nxn array, return the array elements arranged from outermost elements to the middle element,
# traveling clockwise

def snail(array)
  $help_array = array.map(&:clone)
  $x_dimension = array.length-1
  $y_dimension  = array.length-1
  $result = []
  while !$help_array.empty? do
    left(0)
    $y_dimension -= 1
    if !$help_array.empty?
      down($x_dimension)
      $x_dimension -= 1
    end
    if !$help_array.empty?
      right($y_dimension)
      $y_dimension -= 1
    end
    if !$help_array.empty?
      up(0)
      $x_dimension -= 1
    end
   end

  return $result
end

 def left(x)
      $help_array[x].each do |n|
        $result.push(n)
      end
    $help_array.delete($help_array[x])
 end

def down(y)
      $help_array.each do |n|
        $result.push(n[y])
      end
    $help_array.each_index do |i|
        $help_array[i].delete_at(y)
      end

 end

def right(x)
      $help_array[x].reverse_each do |n|
        $result.push(n)
       end
        $help_array.delete($help_array[x])
 end

def up(y)
  $help_array.reverse_each do |n|
        $result.push(n[y])
      end
    $help_array.reverse_each.with_index do |n, i|
        $help_array[i].delete_at(y)
      end
 end
