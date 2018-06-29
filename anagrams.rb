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



def third_anagram?(str1, str2)

  str1.chars.sort == str2.chars.sort

end

p third_anagram?("gizmosally", "sallysally")    #=> false
p third_anagram?("elvis", "lives")    #=> true


def fourth_anagram?(str1, str2)
  hash1, hash2 = Hash.new(0), Hash.new(0)
  str1.chars.each {|ch1| hash1[ch1] += 1}
  str2.chars.each {|ch2| hash2[ch2] += 1}

  hash1 == hash2

end

p fourth_anagram?("gizmosally", "sallysally")    #=> false
p fourth_anagram?("elvis", "lives")

def fifth_anagram?(str1, str2)
  hash1 = Hash.new(0)
  str1.chars.each {|ch1| hash1[ch1] += 1}

  str2.chars.each {|ch2| hash1[ch2] -= 1}

  hash1.values.all? {|el| el == 0}

end


p fifth_anagram?("gizmosally", "sallysally")    #=> false
p fifth_anagram?("elvis", "lives")
