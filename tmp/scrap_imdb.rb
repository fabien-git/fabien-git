require 'open-uri'
require 'nokogiri'
require 'csv'


url = 'https://m.imdb.com/chart/top/?ref_=nv_mv_250'

html_file = URI.open(url, "User-Agent"=>'mozilla').read
doc = Nokogiri::HTML.parse(html_file)

urls = doc.search(".dSNKnk .ipc-metadata-list-summary-item__c a").first(5).map { |film| "https://m.imdb.com/"+film["href"] }

# recherche par film : titre, date, directeur, real , 3 meilleurs acteurs
urls = urls.map do |url|
  html_file = URI.open(url, "User-Agent"=>'mozilla').read
  doc = Nokogiri::HTML(html_file)
  titre = doc.search(".jJsEuz .fDTGTb").text.strip
  annee = doc.search(".jJsEuz li")[0].text.strip
  real = doc.search(".gmonkL ul li ul li")[0].text.strip
  resume = doc.search(".dsxJBN p").text.strip[0..150]+ "..."
  acteurs = doc.search(".gmonkL .fUguci").map { |acteur| acteur.text.strip}.first(3)
  {titre: titre, annee: annee, realisateur: real, resume: resume, acteurs: acteurs}
end



CSV.open('movies.csv', 'w') do |file|
  urls.each { |url|  file << url.values }
end #Store
