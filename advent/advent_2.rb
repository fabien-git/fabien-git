file = File.open("data2.txt","r")
resultat = []

#string = "Game 1: 1 blue; 4 green, 5 blue; 11 red, 3 blue, 11 green; 1 red, 10 green, 4 blue; 17 red, 12 green, 7 blue; 3 blue, 19 green, 15 red"


hash = {
Game: [3],
blue: [1,2],
green:[1,2],
red:[1]
}


#------------- identification-------------------
def identification(string, hash)
  test = string
  regex_word = /[A-Za-z]/
  regex_number= /\d/
  couleur = test.scan(regex_word).join.to_sym
  nombre = test.scan(regex_number).join.to_i
  hash[couleur] << nombre
end
#-------------------------------------------------

#-----------------reset du hash-------------------
def reset(hash)
  hash =  hash.map { |key, value| [key, []] }.to_h
end
#-------------------------------

#----------------attribution au hash------------
def possible?(hash)
  bool_blue = hash[:blue].all? { |element| element <= 14}
  bool_red = hash[:red].all? { |element| element <= 12}
  bool_green = hash[:green].all? { |element| element <= 13}
  bool_blue & bool_green & bool_red ? hash[:Game][0] : 0
end

def max(hash)
  maxblue = hash[:blue].max
  maxred = hash[:red].max
  maxgreen = hash[:green].max
  maxblue * maxgreen * maxred
end

file.each_line do |line|

  string = line.strip
  array = string.split(':')
  array = [array[0], array[1].split(";")]
  array[1].map! { |line| line.split(',')}

  hash = reset(hash)
  identification(array[0], hash)
  array[1].each do |element|
    element.each do |sous_element|
      identification(sous_element, hash)
    end

  end
  p hash
  resultat << max(hash)
end
p resultat
p resultat.sum
