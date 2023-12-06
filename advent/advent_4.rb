def game_one (array_game, array_user, resultat)
  array_game.each_with_index do |line, id|
    resultat_line =[]
    line.each do |element|
      resultat_line << element if array_user[id].include?(element)
    end
    resultat << resultat_line.length
  end
  resultat.select! { |element| element != 0 }
  resultat.map! do |element|
    2 ** (element - 1)
  end
 resultat.sum
end

def game_two (array_game, array_user, resultat)
  array_game.each_with_index do |line, id|
    resultat_line =[]
    modification= []
    resultat[id] = []
    line.each do |element|
      resultat_line << element if array_user[id].include?(element)
    end
    resultat_line.each_with_index do |element,id_mod|
      resultat[id] << (id + 1 + id_mod + 1)
    end
  end
  resultat.map! { |element| element.length}
  p resultat
  sum = 0
  resultat.each_with_index do |element, id|
    if element != 0
      p element + (2 ** (id -1 ))
      sum += element + (2 ** (id -1 ))
    end
  end
  p sum
end



file = File.open("data4.txt", "r")
array_game = []
array_user = []
resultat = []
file.each_line do |line|
  array_game << line.strip.split('|')[0].split(':')[1]
  array_user << line.strip.split('|')[1]
end

array_game = array_game.map do |line|
  line.scan(/\d+/).map { |element| element.to_i}
end
array_user = array_user.map do |line|
  line.scan(/\d+/).map { |element| element.to_i}
end

#p game_one(array_game, array_user, resultat)
p game_two(array_game, array_user, resultat)
