class LitBot
  def eat_file(file_name)
    file = File.open(file_name)
    @source_text = file.read
    file.close
  end

  def speak_first_10_words
    puts @source_text.split(' ').first(10)
  end

  def digest_file
    source_text_words = @source_text.split(' ')
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
  end

  def speak
    puts word_pairs_and_probabilities.first
  end
end

bender = LitBot.new
bender.eat_file("huckle.txt")
# bender.speak_first_10_words # an example call
bender.digest_file
bender.speak

ulysses_bot = LitBot.new
ulysses_bot.eat_file("ulysses.txt")
# ulysses.speak_first_10_words # an example call
ulysses_bot.digest_file
ulysses_bot.speak

# BONUS HW
hybrid_bot = ulysses_bot + bender
hybrid_bot.speak

# ulysses = File.open("ulysses.txt")
# source_text = ulysses.read
# ulysses.close

# source_text_words = source_text.split(' ')
# word_pairs_and_probabilities = {}

# source_text_words.each_with_index do |word, index|
  # hash_key = "#{word} #{source_text_words[index + 1]}"
  # hash_value = source_text_words[index + 2]
  # if word_pairs_and_probabilities[hash_key]
    # word_pairs_and_probabilities[hash_key] << hash_value
  # else
    # word_pairs_and_probabilities[hash_key] = [hash_value]
  # end
# end

# # puts word_pairs_and_probabilities
# output_text = ['They', 'came']

# story = 0
# while story < 35 do
  # word_pair = output_text.last(2).join(' ')
  # next_word = word_pairs_and_probabilities[word_pair].sample unless word_pairs_and_probabilities[word_pair].nil?
  # output_text << next_word

  # if next_word && (next_word.include?(".") || next_word.include?("?"))
    # story += 1
  # end
# end
# puts output_text.join(' ')







