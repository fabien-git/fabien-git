def complete_array(array)
  new_line = '.' * (array[0].length + 2)
  array = array.map do |element|
    '.' + element + '.'
  end
  array.push(new_line)
  array.unshift(new_line)
  array
end

def search(line,number)
  regex_internal=/\D/
  start_index =0
  start_index = line.index("."+number+".") ||line.index("%"+number+".") ||line.index("."+number+"%")||line.index("%"+number+"%")

  if start_index.nil?
    return nil
  else

      end_index = number.length + start_index + 1
     return [start_index + 1, end_index]
  end
end

solution =[]
regex_solution = /[^A-Za-z0-9.]/
file = File.open("data3.txt","r")
array = []
file.each_line do |line|
  line = line.strip
  input_string = "abc!@#$%^&*()123.456"
output_string = line.gsub(/[^A-Za-z0-9.]/, '%')
  array << output_string.strip

end

array = complete_array(array)
p array
puts array.length





regex =/[^\d\.\*]*\d+[^\d\.\*]*/
all_numbers = array.join.scan(regex)


all_numbers.map! do |el|
  matches = el.match(/\d+/)
# Vérification si des chiffres ont été trouvés
if matches
  # Extraction de la séquence de chiffres et conversion en entier
  integer_value = matches[0].to_i
  integer_value.to_s
 end
end
p all_numbers


all_numbers.each do |number|
  if number =="533"
    p number + "-----------------------------------------------"
  end
  array.each_with_index do |element, index_1|

    index = search(element,number)

    if index.nil?
      next
    else
      result_ligne1 = array[index_1-1][index[0]-1..index[1]]
      result_ligne2 = array[index_1][index[0]-1..index[1]]
      result_ligne3 = array[index_1+1][index[0]-1..index[1]]

      result = result_ligne1 + result_ligne2 +result_ligne3
      p result
      if result.match(regex_solution)
        p "ok"
        solution << number


      else
        result
      end
      i=0
      p index
      while i<number.length
        #puts "chiffre : #{array[index_1][index[0]+i]}"
         array[index_1][index[0]+i] = "."
        i += 1
      end
    end
  end

end




solution.map! do |el|
  matches = el.match(/\d+/)
# Vérification si des chiffres ont été trouvés
if matches
  # Extraction de la séquence de chiffres et conversion en entier
  integer_value = matches[0].to_i
 end
end

p all_numbers.length
puts solution.length
p solution.sum
