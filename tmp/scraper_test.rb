require 'open-uri'
require 'nokogiri'
require 'yaml' # Built in, no gem required

USER_AGENT = "Mozilla"

def scrape(url)
  html = URI.open(url, {'User-Agent' => USER_AGENT}).read
  Nokogiri::HTML(html)
end

url = 'https://www.imdb.com/chart/top/'
doc = scrape(url)

urls = doc.search('.irGIRq a').first(5).map do |element|
  "https://www.imdb.com" + element.attributes['href'].value
end

p urls

data = urls.map do |url|
  doc = scrape(url)
  title = doc.search('.fDTGTb').text.strip
  year = doc.search('.kdXikI a').first.text.strip
  storyline = doc.search('.kJJttH').text.strip
  director = doc.search('.jFHENY a').first.text.strip

  cast = doc.search('.fUguci').first(3).map do |actor|
    actor.text.strip
  end

  { title: title, year: year, storyline: storyline, director: director, cast: cast}
end

File.open('movies.yml', 'w') do |file|
  file.write data.to_yaml
end #Store
