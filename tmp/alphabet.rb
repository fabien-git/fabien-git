def alphabet(sentence)
  regex = /#/
  regex_shelter = /\[([^\]]*)\]/
  # cas 1 pas # donc on retour tout
  if sentence.scan(regex).empty?
    return sentence.gsub(/[\[\]]/,'')
  # cas 2 on a un # donc on garde ce qu'il y a dans les crochets
  else
    array_sentence = sentence.match(regex_shelter)
    return array_sentence.to_a[1..array_sentence.length].join('').gsub(/[\[\]]/,'')
  end


end


p alphabet('abde[fgh]ijk')
p alphabet('ab#de[fgh]ijk')
