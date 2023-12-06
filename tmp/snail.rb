def snail(array)
  result= []
  while !array.empty?
    first_line = true
    cpt = 0
    while cpt < array.length
     if first_line
      result << array.shift
    else
      result << array[cpt].pop
      cpt += 1
     end
     first_line = false
    end
    array = array_reverse(array)
  end
result.flatten
end

def array_reverse(array)
  array = array.reverse
  array.map { |line| line.reverse}
end



  tableau = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  #p array_reverse(tableau)
  p snail(tableau)
