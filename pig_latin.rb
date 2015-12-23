require 'pry'

class PigLatin
	attr_reader :beginning, :ending

	def assess(word)
		if first_sounds.include?(word[0..1])
			@ending = word[2..-1]
			@beginning = word[0..1]
		elsif word[1] == "r" && !r_exclusions.include?(word[0])
			@ending = word[2..-1]
			@beginning = word[0..1]
		elsif three_letter_sounds.include?(word[0..2])
			@ending = word[3..-1]
			@beginning = word[0..2]
		else
			@ending = word[1..-1]
			@beginning = word[0]
		end
	end

	def first_letter(word)
		assess(word)
		beginning
	end

	def word_end(word)
		assess(word)
		ending
	end

	def first_sounds
		%w[sh th ch ph qu]
	end

	def r_exclusions
		%w[a e h i j l m n o q u x y]
	end

	def three_letter_sounds
		%w[sch thr]
	end

	def translate(word)
		assess(word)
		word_end(word) + " " + first_letter(word) + "ay"
	end
end