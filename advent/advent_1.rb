
file = File.open("data1.txt","r")
array = []
CHIFFRE= {
  "one" => "1",
  "two" => "2",
  "three" => "3",
  "four" => "4",
  "five" => "5",
  "six" => "6",
  "seven" => "7",
  "eight" => "8",
  "nine" => "9"
}





def conversion (string)
  regex = /(one)|(two)|(three)|(four)|(five)|(six)|(seven)|(eight)|(nine)/
  while string.match(regex)
    letter = string.match(regex)[0]
    string.gsub!(letter[0..-2], CHIFFRE[letter])
  end

  string
end


file.each_line do |line|
  array << line.strip
end

array.map! do |element|
  element = conversion(element)
  regex= /\d/
  result = element.scan(regex)



  if result.length >= 2
    [result.first, result.last].join.to_i
  elsif result.length == 1
    [result[0], result[0]].join.to_i
  else
    0
  end
end
p array.length
p array.sum
#p array.each_with_index { |nb , id| puts " #{id + 1} : #{nb}"}
