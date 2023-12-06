=begin

find = 50
choix= 0
cpt = 0

while choix != find
  cpt +=1
  puts " choisissez un nombre"
  choix = gets.chomp.to_i
  break  if choix == find
  if choix > find
    puts " Votre nombre est trop grand"
  else
    puts " Votre nombre est trop petit"
  end

end

if cpt == 1
  puts "Bravo! vous avez trouvé en #{cpt} tour"
else
  puts "Bravo! vous avez trouvé en #{cpt} tours"
end

=end
require 'date'
Xmas = Date.parse("2023/12/24")
today = Date.today
puts Xmas-today
