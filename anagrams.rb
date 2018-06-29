require 'byebug'

def first_anagram?(str1, str2)
  anagrams = []
  chars = str1.chars
  perms = chars.permutation.to_a
  perms.include?(str2.chars)
end

# p first_anagram?("gizmosally", "sallysally")    #=> false
p first_anagram?("elvis", "lives")    #=> true

def second_anagram?(str1, str2)
  chars1, chars2 = str1.chars, str2.chars

  changed = true
  until changed == false

    changed = false
    chars1.each_with_index do |ch1, idx1|
      chars2.each_with_index do |ch2, idx2|
        if chars1[idx1]==chars2[idx2]
          chars1.delete_at(idx1)
          chars2.delete_at(idx2)
          changed = true
        end
      end
    end
  end
  chars1.empty? && chars2.empty? ? true : false
end

p second_anagram?("gizmosally", "sallysally")    #=> false
p second_anagram?("elvis", "lives")    #=> true
