require 'minitest/autorun'
require_relative 'pig_latin'

class PigLatinTest < Minitest::Test
	attr_reader :pl

	def setup
		@pl = PigLatin.new
	end

	def test_selects_first_letter_for_normal_word
		assert_equal "p", pl.first_letter("pig")
	end

	def test_selects_first_letter_first_sounds
		assert_equal "sh", pl.first_letter("shoe")
	end

	def test_selects_first_two_letters_if_r_is_second_letter
		assert_equal "tr", pl.first_letter("tree")
		assert_equal "a", pl.first_letter("area")
	end

	def test_selects_first_three_letters_if_first_sound_is_three_letters
		assert_equal "sch", pl.first_letter("school")
	end

	def test_extracts_end_of_word
		assert_equal "ig", pl.word_end("pig")
		assert_equal "oe", pl.word_end("shoe")
		assert_equal "ee", pl.word_end("tree")
		assert_equal "rea", pl.word_end("area")
		assert_equal "ool", pl.word_end("school")
	end

	def test_it_responds_with_pig_latin_string
		assert_equal "ig pay", pl.translate("pig")
		assert_equal "oe shay", pl.translate("shoe")
		assert_equal "ee tray", pl.translate("tree")
		assert_equal "rea aay", pl.translate("area")
		assert_equal "ool schay", pl.translate("school")
	end
end