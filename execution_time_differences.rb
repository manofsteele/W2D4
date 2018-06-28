require 'byebug'

def my_min1(arr)

  arr.each do |el1, idx1|
    least = true
    arr.each_with_index do |el2, idx2|
      if idx1 != idx2
        if el1 > el2
          least = false
        end
      end
    end
    return el1 if least == true
  end
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
p my_min1(list)
# 0.172s, n^2


def my_min2(arr)
  least = arr.first
  arr.each_with_index do |el,idx1|
    least = el if el < least
  end
  least
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
p my_min2(list)
#0.166s, n


def largest_contiguous_subsum1(list)
  sub_arrays = []
  (0...list.length).each do |i|
    sub_arrays << [list[i]]
    (i + 1...list.length).each do |j|
      sub_arrays << sub_arrays.last + [list[j]]
    end
  end
  # sub_arrays
  max_value = sub_arrays.first.first
  sub_arrays.each do |sub|
    max_value = sub.reduce (:+) if sub.reduce(:+) > max_value
  end
  max_value
end


list = [5, 3, -7]
p largest_contiguous_subsum1(list) # => 8

list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum1(list) # => 8 (from [7, -6, 7])

list = [-5, -1, -3]
p largest_contiguous_subsum1(list) # => -1 (from [-1])

#n^2

def largest_contiguous_subsum(list)
  totals = []
  current = list[0]
  greatest = list[0]
  list[1..-1].each do |el|
    current + el < el ? current = el : current += el
    greatest = current if current > greatest
  end
  greatest
end



list = [5, 3, -7]
p largest_contiguous_subsum(list) # => 8

list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

list = [-5, -1, -3]
p largest_contiguous_subsum(list) # => -1 (from [-1])
