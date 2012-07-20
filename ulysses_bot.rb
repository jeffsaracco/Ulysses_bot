ulysses = File.open("ulysses.txt")
source_text = ulysses.read
ulysses.close

source_text_words = source_text.split(' ')
word_pairs_and_probabilities = {}

source_text_words.each_with_index do |word, index|
  hash_key = "#{word} #{source_text_words[index + 1]}"
  hash_value = source_text_words[index + 2]
  if word_pairs_and_probabilities[hash_key]
    word_pairs_and_probabilities[hash_key] << hash_value
  else
    word_pairs_and_probabilities[hash_key] = [hash_value]
  end
end

# puts word_pairs_and_probabilities
output_text = ['They', 'came']

story = 0
while story < 35 do
  word_pair = output_text.last(2).join(' ')
  next_word = word_pairs_and_probabilities[word_pair].sample unless word_pairs_and_probabilities[word_pair].nil?
  output_text << next_word

  if next_word && (next_word.include?(".") || next_word.include?("?"))
    story += 1
  end
end
puts output_text.join(' ')







