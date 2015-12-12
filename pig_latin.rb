class PigLatin

  def self.translate(words)
      words.split.map(&method(:translate_words)).join(' ')
  end

  def self.translate_words(word)
    alphabet = ('a'..'z').to_a
    vowels = %w[a e i o u]
    consonants = alphabet - vowels

    if vowels.include?(word[0]) || word[0..1] == 'yt' || word[0..1] == 'xr'
      word + 'ay'
    elsif word[0..1] == "qu"
      word[2..-1] + "quay"
    elsif word[0..2] == "squ" || word[0..2] == "thr" || word[0..2] == "sch"
       word[3..-1] + word[0..2] + "ay"
    elsif consonants.include?(word[0]) && consonants.include?(word[1])
       word[2..-1] + word[0..1] + 'ay'
    else consonants.include?(word[0])
      word[1..-1] + word[0] + 'ay'
    end
  end
end
