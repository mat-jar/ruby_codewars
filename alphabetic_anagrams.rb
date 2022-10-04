# Alphabetic Anagrams
# https://www.codewars.com/kata/53e57dada0cb0400ba000688

# Return a number to every word, based on where it falls in an alphabetically sorted list of all its anagrams

def listPosition(word)
    positions = word.chars.sort.join.squeeze
    word_array = []
    word.chars.each do |ch|
        word_array.push(positions.index(ch)+1)
    end
    precedents = 0
    remained_numbers = word_array
    word_array.each do |n|
        smaller = remained_numbers.select { |i| i < n }.uniq
        remained_numbers = remained_numbers[1..-1]
        factorial = remained_numbers.length > 0 ?  (1..remained_numbers.length).inject(:*) : 1

        smaller.each do |m|
            minus= 1
            with_smaller = remained_numbers.map(&:clone)
            with_smaller[with_smaller.index(m)] = n
            duplicates = with_smaller.each_with_object(Hash.new(0)) { |n, h| h[n] +=1 }.delete_if {|k, v| v == 1}.values
            duplicates.each do |v|
              minus *= (1..v).inject(:*) if !duplicates.empty?
            end
            precedents += (factorial/minus)
        end
    end
    return precedents +1
