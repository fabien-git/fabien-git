require 'nokogiri'
require 'open-uri'
require 'json'
#
#URL = "https://www.imdb.com/chart/top/"
#
#html_file = URI.open(URL, { "User-Agent"=>'mozilla' }).read
#doc = Nokogiri::HTML(html_file)
#
#result= []
#doc.search('.irGIRq a').each do |element|
#  result << "https://www.imdb.com/"+element.attributes["href"].value
#end
#url_top5 = result[0...5]
#
## récuperer les infos depuis les
#puts url_top5
#
#premier = URI.open(url_top5[0], { "User-Agent"=>'mozilla' }).read
#doc1 = Nokogiri::HTML(premier)
#
#puts nom = doc1.search('.fDTGTb').text.strip
#puts annee = doc1.search('.kdXikI a').first.text.strip
#puts commentaire = doc1.search('.eVLpWt').first.text.strip
#puts real = doc1.search('.jFHENY a').first.text.strip
#


def run_game(attempt, grid, start_time, end_time)
 # TODO: runs the game and return detailed hash of result (with `:score`, `:message` and `:time` keys)
  # créer le hash de résultats
  grid = grid.map { |element| element.downcase}
  p grid
  result = {}
  result[:time] = (end_time - start_time).to_i
  # passer le mot saisi en minuscules et le mettre dans un array
  attempt_array = attempt.downcase.chars
  # Vérifier que le mot n'est composé que de lettres de la grille une seule fois
  contain = attempt_array.all? do |letter|
    grid.include?(letter)
  end
    # si faux => t'as perdu parce que tu n'as pas respecté la grid
    if contain == false
      result[:score] = 0
      result[:message] = "you did not respect the given grid"
    else
      # appeler l'API sur le mot saisi
      response = URI.open("https://wagon-dictionary.herokuapp.com/#{attempt}")
      # parser le json
      data = JSON.parse(response.read)
      p data
      # si found = false => t'as perdu parce que le mot n'est pas bon avec le décompte
      if data["found"] == false
        result[:score] = 0
        result[:message] = "this word does not exist"
      # si found = true => bravo + score
      else
        score = (1 / (end_time - start_time)) * attempt.length
        result[:score] = score
        result[:message] = "Bravo, votre score est #{score}"
      end
    end
    return result
  end


p run_game("wolf", ["W","O","L","F","A","A","A"], 5, 10)
