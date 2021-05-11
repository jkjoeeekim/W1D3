require "byebug"

def palindrome?(str)
    reversed = ""
    # debugger
    str.each_char { |char| reversed = char + reversed }
    reversed == str
end

def substrings(str)
    substring_array = []
    (0...str.length).each do |idx1|
        (idx1...str.length).each do |idx2|
            substring_array << str[idx1..idx2]
        end
    end
    substring_array
end

def palindrome_substrings(str)
    substring_array = substrings(str)
    substring_array.select { |sub| palindrome?(sub) && sub.length > 1 }
end